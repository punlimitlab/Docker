#!/bin/bash

if docker images | grep punlimitlab/aspnetbase | grep latest;
then
	echo "Image already exist"
else
	echo "Image does not exist, creating it"
	mkdir /tmp/dockertmp
	cp ./BaseImages/Dockerfile.base.arm /tmp/dockertmp/Dockerfile
	docker build -t punlimitlab/aspnetbase:latest /tmp/dockertmp
	rm -Rf /tmp/dockertmp
fi

echo "Push on docker hub"
docker push punlimitlab/aspnetbase:latest

echo "Done!"
