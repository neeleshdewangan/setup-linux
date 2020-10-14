lib="$HOME/library"

mkdir -p $lib
aws s3 cp s3://smartad-dmp/lib/lightlda.tgz $lib
cd $lib
tar zxvf lightlda.tgz
rm lightlda.tgz
cd -
echo "lightlda path: $lib/lightlda"
