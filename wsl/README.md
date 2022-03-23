# Setting up WSL2

## Updating the system

```bash
sudo apt update && sudo apt upgrade -y

sudo apt install curl file git zsh autojump zip unzip
```

## Install oh-my-zsh

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install [powerlevel10k] theme

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Set `ZSH_THEME="powerlevel10k/powerlevel10k"` in `~/.zshrc`.

## Prepare development environment

* Use latest CMake
  ```bash
  https://apt.kitware.com/
  ```

* Install packages

  ```bash
  sudo apt install -y wget build-essential gdb cppcheck flex bison gperf python3 python3-pip python3-setuptools cmake ninja-build ccache libffi-dev libssl-dev dfu-util libusb-1.0-0
  ```

* Make python3 and pip3 as default python

  ```bash
  sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1

  sudo update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1
  ```