sudo yum -y install rpm-build
sudo yum -y install redhat-rpm-config
sudo useradd chrisd
sudo su - chrisd -c "mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}"
sudo su - chrisd -c "echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros"
sudo yum -y install make gcc

