#!/bin/bash
#  ██████╗ ██████╗ ██████╗ ███████╗███╗   ███╗ █████╗ ███╗   ██╗
# ██╔════╝██╔═══██╗██╔══██╗██╔════╝████╗ ████║██╔══██╗████╗  ██║
# ██║     ██║   ██║██║  ██║█████╗  ██╔████╔██║███████║██╔██╗ ██║
# ██║     ██║   ██║██║  ██║██╔══╝  ██║╚██╔╝██║██╔══██║██║╚██╗██║
# ╚██████╗╚██████╔╝██████╔╝███████╗██║ ╚═╝ ██║██║  ██║██║ ╚████║
#  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝

clear
echo -e "\n ██████╗ ██████╗ ██████╗ ███████╗███╗   ███╗ █████╗ ███╗   ██╗
██╔════╝██╔═══██╗██╔══██╗██╔════╝████╗ ████║██╔══██╗████╗  ██║
██║     ██║   ██║██║  ██║█████╗  ██╔████╔██║███████║██╔██╗ ██║
██║     ██║   ██║██║  ██║██╔══╝  ██║╚██╔╝██║██╔══██║██║╚██╗██║
╚██████╗╚██████╔╝██████╔╝███████╗██║ ╚═╝ ██║██║  ██║██║ ╚████║
 ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝"
echo "\nPackage manager (yum / apt):"
read package
echo "\nHost:"
read host
echo "\nUser:"
read user

echo "\n\nGit Install ..."

if [[ "$package" = "yum" ]]; then
	yum install git -y
elif [[ "$package" = "apt" ]]; then
	apt-get install git -y
fi

git config --global user.name "Codeman Company"
git config --global user.email info@codeman.company

mkdir ~/codeman.git
mkdir ~/app
cd ~/codeman.git && git init --bare --shared

# Hooks
echo -e '#!/bin/bash\ngit --work-tree="/home/$user/app" --git-dir="/home/$user/codeman.git" checkout -f' > ~/codeman.git/hooks/post-receive
chmod 755 ~/codeman.git/hooks/post-receive

# Connect to repository
echo "ssh-add ~/.ssh/cert"
echo "git clone $user@$host:~/codeman.git"
echo "git remote add production $user@$host:~/codeman.git"