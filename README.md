## First time setup

Install packer  
Windows
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim "%USERPROFILE%/AppData/Local/nvim-data/site/pack/packer/start/packer.nvim
```
Note: You need the x64 MSVC vars loaded. You will also need node.js installed.  

Linux
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Open nvim  
Navigate to packer.lua  
`:so`  
`:PackerSync`  
Quit and reopen. Treesitter should start downloading and compiling languages.

## Installing neovim on WSL
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
```

