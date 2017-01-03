#!/bin/bash

[ -d done ] || mkdir done

function fail() {
    local status="$?"
    [[ $status -eq 0 ]] && status=1
    cat << EOF

    something went wrong
    exit on FAILURE !!

EOF
    exit $status
}

function download() {
    local url="$1"
    local md5="$2"
    local dest="$3"
    if ! md5sum $dest 2>/dev/null | grep $md5; then
        wget $url -O $dest
        if ! md5sum $dest 2>/dev/null | grep $md5; then
            echo "MD5 not matching"
            fail
        fi
    fi
}

function once() {
    echo "--------------------------------"
    [[ -n $1 ]] || return
    DONE_FILE="done/$1"
    if [[ -e $DONE_FILE ]]; then
        echo "$1 already done on $(date --reference $DONE_FILE)"
        return
    fi

    echo "[$(date) $(hostname)] $* ..."
    $*
    local status=$?
    [[ -e $DONE_FILE ]] || {
        cat << EOF

    "$1 NOT done !!!"

EOF
        exit 1
    }
}

function once_done() {
    echo "[DONE $(date)] $*"
    if [[ -n $1 ]]; then
        echo $* > $DONE_FILE || fail
    else
        touch $DONE_FILE || fail
    fi
}

function setTimeZone() {
    TIME_ZONE=$(timedatectl | egrep 'Time[ ]?zone')
    if [[ $(echo $TIME_ZONE | grep 'Europe/Rome' | wc -l) -eq 0 ]]; then
        echo $TIME_ZONE
        echo "setting time zone to Europe/Rome ..."
        timedatectl set-timezone Europe/Rome || fail
    fi
}

function enable_byobu() {
    byobu-launcher-install || fail
    RECONNECT=1
    once_done
}

function ssh_disable_accept_env_and_pwd() {
    sed --in-place 's/^AcceptEnv/#AcceptEnv/' /etc/ssh/sshd_config || fail
    echo -e "\n\nPasswordAuthentication no\n" >> /etc/ssh/sshd_config
    service ssh restart || fail
    RECONNECT=1
    once_done
}

function reconnect_if_needed() {
    if [[ $RECONNECT -eq 1 ]]; then
        cat <<EOF

    Disconnecting !
    Please, reconnect and launch the script again !!!

EOF
        ps -ef | grep "sshd:" | grep -v grep | awk '{print $2}' | xargs kill && exit 1
    fi
}

function create_swap_file() {
    fallocate -l 2G /swapfile || fail
    chmod 600 /swapfile || fail
    mkswap /swapfile || fail
    grep '/swapfile' /etc/fstab || \
    echo '/swapfile   none    swap    sw    0   0' >> /etc/fstab
    swapon -a || fail
    swapon -s | grep 'swapfile' || fail

    once_done
}

function update() {
    apt-get update || fail
    apt-get install -y aptitude || fail
    aptitude -y full-upgrade || fail
    once_done
    cat << EOF

    REBOOTING the droplet !
    Please, relaunch the script after reboot !!!

EOF
    reboot
    exit 1
}

function activate_firewall() {
    ufw allow ssh || fail
    ufw allow http || fail
    ufw allow https || fail
    ufw --force enable || fail
    once_done
}

function install_utils() {
    apt-get install -y htop ntp tree python && once_done
}

function end() {
    cat <<EOF

    all done
EOF
    (
        cd done && ls -1rt | while read file; do
            [[ -s $file ]] && echo "    $(cat $file)";
        done
    )
    echo
}

(
    echo "==============================="
    setTimeZone
    echo "$(date) running on $(hostname)"

    RECONNECT=0
    once enable_byobu
    once ssh_disable_accept_env_and_pwd
    reconnect_if_needed

    once activate_firewall
    once create_swap_file
    once update
    once install_utils

    end
) | tee --append INSTALL.log
exit ${PIPESTATUS[0]}
