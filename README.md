# Bash Configuration Project

This repository contains configuration files and scripts to customize the Bash shell environment. It includes aliases, prompt configurations, and automation scripts for installation.

## Table of Contents

1. [Introduction](#introduction)
2. [Files](#files)
3. [Installation](#installation)
4. [Usage](#usage)
5. [License](#license)
6. [Author](#author)

## Introduction

The Bash Configuration Project aims to provide a set of convenient aliases, prompt configurations, and installation scripts to enhance the Bash shell experience. It includes various aliases for common commands, colorized outputs, and a customized prompt displaying helpful information like the current working directory, Git branch, and elapsed time for command execution.

## Files

The project contains the following files:

1. `.aliases`: A configuration file containing useful aliases for common commands and utilities.
2. `.bashrc`: The main Bash configuration file, including the prompt generation function and command timer.
3. `install.sh`: An automation script to install the configuration files to the user's home directory and set up the prompt with a personalized name.
4. `prerequisit.sh`: A script to install prerequisite packages required for the configuration, such as `figlet` for prompt generation and `colordiff` for colorizing the `diff` output.

## Installation

To install the Bash configuration and prompt customization, follow these steps:
```sh

git clone https://github.com/gr-an/dotfiles dotfiles && cd dotfiles && chmod +x install.sh && ./install.sh

```
1. Clone this repository to your local machine.
2. Make the `prerequisit.sh` script executable by running `chmod +x prerequisit.sh`.
3. Execute `./prerequisit.sh` to install prerequisite packages like `figlet`, `git completion`, `exa`, and `colordiff`.
4. Run `install.sh` to set up the configuration files in your home directory and personalize the prompt with your name.

## Usage

### Aliases

The `.aliases` file provides several aliases for common commands and tasks, making your command line experience more efficient. Some notable aliases include:

- `claer` and `cls`: Alias for `clear`.
- `gerp`: Alias for `grep`.
- `l` and `ll`: Aliases for `exa -l` and `exa -la`, respectively, for listing files and directories with additional details.
- `..` and `...`: Aliases for navigating up directories.
- `tar` and `untar`: Aliases for creating and extracting tar archives.
- `grep`, `egrep`, and `fgrep`: Colorized grep commands for easier reading of log files.
- `diff`: Alias for `colordiff` to view colored `diff` output.
- Many more helpful aliases for process management, system information, and networking.

### Prompt Customization

The `.bashrc` file contains a function to generate a customized prompt that includes:

- A checkmark or X symbol indicating the success or failure of the last command.
- Elapsed time for command execution, displayed in seconds, milliseconds, or microseconds, depending on the duration.
- Username, working directory, Git branch, and Kubernetes context and namespace (if applicable).

### Automation

The `install.sh` script automates the installation process, copying the configuration files to your home directory and personalizing the prompt with your name. Simply run the script and follow the instructions.

## License

This project is licensed under the [MIT License](LICENSE).

## Author

This project was created and maintained by Andranik Grigoryan. You can find more of his work on [GitHub](https://github.com/andranikgr) and [LinkedIn](https://www.linkedin.com/in/andranikgr/).

