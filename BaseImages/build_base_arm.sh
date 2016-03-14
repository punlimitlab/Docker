#!/bin/bash

if docker images | grep punlimitlab/aspnetbase | grep latest;
then
	echo "Image already exist"
else
	echo "Image does not exist, creating it"
	mkdir /tmp/dockertmp
	cp Dockerfile.base.arm /tmp/dockertmp/Dockerfile
	docker build -t punlimitlab/aspnetbase:latest /tmp/dockertmp
	rm -Rf /tmp/dockertmp
	
	echo "Push on docker hub"
	docker push punlimitlab/aspnetbase:latest
fi

echo "Done!"
