# Docker

## How to install Docker

### Homebrew

Run the following command from your local computer (you’ll need to have sudo access to your machine).
For more information please advice [Homebrew at the command line](https://brew.sh/).

```{}
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)”
```

Run these commands in your terminal to add Homebrew to your PATH:
```{}
echo >> /Users/<your_username>/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/<your_username>/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

To get started:
```{}
brew help
```

Further documentation: https://docs.brew.sh


### Homebrew Cask

Homebrew Cask is a Homebrew extension for installing GUI software on Mac. 
Docker on Mac is a GUI tool, so you need to use Homebrew Cask for the installation.

It means that instead of the standard download and drag-and-drop process, you can use this:
```{}
brew install docker –cask
```

🍺 docker was successfully installed!

```{}
docker --version
```
