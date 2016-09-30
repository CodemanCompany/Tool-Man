#!/bin/bash
#  ██████╗ ██████╗ ██████╗ ███████╗███╗   ███╗ █████╗ ███╗   ██╗
# ██╔════╝██╔═══██╗██╔══██╗██╔════╝████╗ ████║██╔══██╗████╗  ██║
# ██║     ██║   ██║██║  ██║█████╗  ██╔████╔██║███████║██╔██╗ ██║
# ██║     ██║   ██║██║  ██║██╔══╝  ██║╚██╔╝██║██╔══██║██║╚██╗██║
# ╚██████╗╚██████╔╝██████╔╝███████╗██║ ╚═╝ ██║██║  ██║██║ ╚████║
#  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝

clear
echo "\n ██████╗ ██████╗ ██████╗ ███████╗███╗   ███╗ █████╗ ███╗   ██╗
██╔════╝██╔═══██╗██╔══██╗██╔════╝████╗ ████║██╔══██╗████╗  ██║
██║     ██║   ██║██║  ██║█████╗  ██╔████╔██║███████║██╔██╗ ██║
██║     ██║   ██║██║  ██║██╔══╝  ██║╚██╔╝██║██╔══██║██║╚██╗██║
╚██████╗╚██████╔╝██████╔╝███████╗██║ ╚═╝ ██║██║  ██║██║ ╚████║
 ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝"
echo "\nUser"
read user
echo "\nHost"
read host

echo "\n\nGit Install ..."
apt-get install git -y

git config --global user.name "Codeman Company"
git config --global user.email info@codeman.company

mkdir ~/codeman.git
mkdir ~/app
cd ~/codeman.git && git init --bare --shared

# Hooks
echo -e '#!/bin/bash\ngit --work-tree="/home/$user/app" --git-dir="/home/$user/codeman.git" checkout -f' > ~/codeman.git/hooks/post-receive

# Connect to repository
echo "ssh-add ~/.ssh/cert"
echo "git clone $user@$host:~/codeman.git"