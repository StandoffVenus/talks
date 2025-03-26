# This script is used to install Browsh on an EC2 instance running AL2

set -e

sudo amazon-linux-extras install -y firefox

OS=$(uname -s)
ARCH=$(uname -m)

# Massaging from aarch => arm
if [ "${ARCH}" = "aarch64" ]; then
	ARCH="arm64"
fi

URL="https://github.com/browsh-org/browsh/releases/download/v1.8.0/browsh_1.8.0_${OS}_${ARCH}.rpm"

curl -o browsh.rpm -f -L "${URL}"
sudo rpm -Uvh ./browsh.rpm
rm ./browsh.rpm
