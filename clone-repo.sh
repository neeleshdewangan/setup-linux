#!/bin/bash
cd $HOME/Desktop/projects/
for repo in sn-feed \
	sn-feed-azkaban \
	sn-dmp-box \
	smart-ad-dmp \
	smartnews-dmp \
	dmp-core-java \
	sn-core-ranking \
	ops-itamae \
	smart-ad-dmp-spark-v2; do
	git clone --recursive git@github.com:smartnews/$repo.git
done

ls -lh .

cd -
