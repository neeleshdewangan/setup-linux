brew tap adoptopenjdk/openjdk
brew cask install adoptopenjdk8
brew cask install adoptopenjdk11

wget https://cdn.azul.com/zulu/bin/zulu7.42.0.13-ca-jdk7.0.282-macosx_x64.zip
unzip -q zulu7.42.0.13-ca-jdk7.0.282-macosx_x64.zip
sudo mv zulu7.42.0.13-ca-jdk7.0.282-macosx_x64/zulu-7.jdk /Library/Java/JavaVirtualMachines/
rm -r zulu*

brew install maven
