#/bin/bash
cd /tmp
wget https://golang.org/dl/
gostableversion=$(grep -A 3 "Stable" index.html | sed -n "4p" | awk  '{print $3}' | awk '{print substr($1,5)}' | awk '{print substr($0, 0, length($0)-1)}')
gounstableversion=$(grep -A 3 "Unstable" index.html | sed -n "4p" | awk  '{print $3}' | awk '{print substr($1,5)}' | awk '{print substr($0, 0, length($0)-1)}')
rm index.html
echo "Chose Version:"
echo "1. Stable"
echo "2. Unstable"
read version

if [ $version == 1 ]
then
echo "You have chosen stable release."
echo "1. For 32 bit system."
echo "2. For 64 bit system."
read arch
if [ $arch == 1 ]
then
wget https://storage.googleapis.com/golang/$gostableversion.linux-386.tar.gz
tar -zxvf go*gz
sudo mv go /usr/local/
echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile
fi
if  [ $arch == 2 ]
then
wget https://storage.googleapis.com/golang/$gostableversion.linux-amd64.tar.gz
tar -zxvf go*gz
sudo mv go /usr/local/
echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile
fi
fi


if [ $version == 2 ]
then
echo "You have chosen Unstable release."
echo "1. For 32 bit system."
echo "2. For 64 bit system."
read arch
if [ $arch == 1]
then
wget https://storage.googleapis.com/golang/$gounstableversion.linux-386.tar.gz
tar -zxvf go*gz
sudo mv go /usr/local/
echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile
fi
if  [ $arch == 2]
then
wget https://storage.googleapis.com/golang/$gounstableversion.linux-amd64.tar.gz
tar -zxvf go*gz
sudo mv go /usr/local/
echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile
fi
fi

echo "Go is installed but you need to reboot your system to work with go and get go command working. happy Journey with Go."
