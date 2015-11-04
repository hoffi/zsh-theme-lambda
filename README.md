# ZSH-Theme Lambda λ

A zsh theme that does not overload your terminal.

## Features

* Current path
* Current git informations
* Displays SSH-Session (prefixes `(ssh) <user>@<host>:` to the path)
* Colorizes the Lambda Sign according to the last return status

## Screenshot

![](https://raw.githubusercontent.com/hoffi/zsh-theme-lambda/master/screenshot.png)

Font used in Screenshot: [Hack](https://github.com/chrissimpkins/Hack)

Color Scheme of iTerm in Screenshot: [Pencil for iTerm](https://github.com/mattly/iterm-colors-pencil)

## Installation

### [antigen](https://github.com/zsh-users/antigen)

Add this line to your `.zshrc`: **(Do not use `antigen theme`!)**
```sh
antigen bundle hoffi/zsh-theme-lambda
```

### Manual

* Add this repo as a submodule or just download `zsh-theme-lambda.plugin.zsh`
* Source it in your `.zshrc`:
```sh
source "<path>/zsh-theme-lambda.plugin.zsh"
```

## Git info symbols

* Unresolved merge conflict: °
* Modified, copied or renamed file: !
* Added file: +
* Deleted file: -
* Untracked file: *
* Unpushed commits: ⬈
