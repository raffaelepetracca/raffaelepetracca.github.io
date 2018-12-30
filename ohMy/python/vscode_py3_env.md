# Python3 in Visua Studio Code on Ubuntu

Create a virtual environment and run code in the environment.

See [Reference](https://www.digitalocean.com/community/tutorials/how-to-install-python-3-and-set-up-a-local-programming-environment-on-ubuntu-16-04) for details.

## Setup

```
sudo apt-get install -y python3-venv
mkdir ~/.python-envs
cd ~/.python-envs/
python3 -m venv py3
```

# Use

```
source ~/.python-envs/py3/bin/activate
code .
```