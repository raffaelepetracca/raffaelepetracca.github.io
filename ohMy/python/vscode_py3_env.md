# Python3 in Visua Studio Code on Ubuntu

Create a virtual environment to be used in Visual Studio Code.

See [How To Install Python 3 and Set Up a Local Programming Environment on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-install-python-3-and-set-up-a-local-programming-environment-on-ubuntu-16-04) for details.

## Setup
Crete the virtual environment

```
sudo apt-get install -y python3-venv
mkdir ~/.python-envs
cd ~/.python-envs/
python3 -m venv py3
source ~/.python-envs/py3/bin/activate
pip install pylint
```

go to your project directory and start Visual Studio Code

```
code .
```

Choose the brand new "py3" as the python environment as described in [Using Python environments in VS Code](https://code.visualstudio.com/docs/python/environments).

This will create the file `.vscode/settings.json` in your project directory:
```
{
    "python.pythonPath": "/home/<your home>/.python-envs/py3/bin/python"
}
```