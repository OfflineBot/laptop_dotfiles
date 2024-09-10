
prompt_user() {
    read -p "Do you want to continue? (y/n): " choice
    case "$choice" in 
        [Yy]* )
            echo "Continuing..."
            ;;
        [Nn]* )
            echo "Exiting..."
            exit 0
            ;;
        * )
            echo "Invalid response. Please answer y or n."
            prompt_user
            ;;
    esac
}

echo "Make sure u've updated your system (sudo pacman -Syu)"
prompt_user

echo "Installing yay"
prompt_user

sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

echo "Installed yay (if no errors)"
echo "Continue if you want to install all packages"
prompt_user

echo "Installing now Packages"
prompt_user

for pkg in \
aylurs-gtk-shell \
baobab \
base \
base-devel \
breeze \
breeze-gtk \
breeze-icons \
breeze-plymouth \
brightnessctl \
btop \
clang \
cmake \
discord \
firefox \
fzf \
gcc \
gdb \
git \
grim \
hyprland \
kitty \
mkinitcpio \
nemo \
neovim \
obsidian \
npm \
pavucontrol \
pipewire \
pyright \
python \
rust \
rust-analyzer \
sddm \
slurp \
stow \
swaylock-effects \
swww \
texlive-basic \
texlive-bin \
texlive-binextra \
texlive-latex \
texlive-latexextra \
texlive-latexrecommended \
unzip \
valgrind \
visual-studio-code-bin \
zathura \
zathura-pdf-poppler \
wl-clipboard; do
    echo "Trying to install $pkg..."
    if yay -S --noconfirm --batchinstall $pkg &> /dev/null; then
        echo "$pkg installed successfully."
    else 
        echo "Failed to install $kpg or it is already installeda."
    fi
done

echo "Finished installation"
echo "Set SDDM Login Manager"
prompt_user

sudo systemctl enable sddm.service
sudo systemctl start sddm.service

echo "You have to install your sddm theme by yourself (KDE Plasma is easy to manage the loginscreen)"
echo "You are finished with the installation Script"
echo "Now dont foget to copy the dotfiles folder in the correct places or use stow"
read
