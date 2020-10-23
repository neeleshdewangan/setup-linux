# Reference https://jwangee.github.io/blog/2017/12/08/protobuf1.html
repo="https://github.com/protocolbuffers/protobuf"
echo -e "check repo for version: $repo"
ver="${1:-3.5.x}"

echo "getting ver: ${ver}"
git clone --recursive $repo
cd protobuf
git checkout $ver

echo "preparing."
yes | pip install protobuf
brew install automake
brew install libtool

echo "configuring."
./autogen.sh
./configure

echo "installing."
make check
make
make install

echo "-- Installed version --"
echo "$(protoc –-version)"
echo "-- -- --"

cd ..

sudo rm -r protoc
