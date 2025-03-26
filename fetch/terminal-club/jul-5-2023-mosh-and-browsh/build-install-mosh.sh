# This script is for building and installing Mosh on an EC2 instance running AL2.
# 
# AL2 does not support EPEL but implies that most packages should still be compatible.
# Mosh happens to be one of the packages that isn't compatible AL2.

sudo yum -y remove mosh # Remove mosh as necessary
sudo yum -y groupinstall 'Development Tools' # Add necessary dev tools (git, make, etc.)

git clone https://github.com/mobile-shell/mosh
cd mosh

sudo yum -y install \
	protobuf-devel \
	protobuf-compiler \
	ncurses-devel \
	openssl-devel

./autogen.sh
./configure --enable-asan # Address sanitizer

make
make check # Compilation checks
sudo make install

cd ..
rm -rf mosh # Remove repository 
