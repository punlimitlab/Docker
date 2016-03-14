#!/bin/bash

if docker images | grep punlimitlab/aspnetbase | grep alpha;
then
	echo "Image already exist"
else
	echo "Image does not exist, creating it"
	mkdir /tmp/dockertmp
	cp ./BaseImages/Dockerfile.base.arm_alpha /tmp/dockertmp/Dockerfile
	docker build -t punlimitlab/aspnetbase:alpha /tmp/dockertmp
	rm -Rf /tmp/dockertmp
	
	echo "Push on docker hub"
	docker push punlimitlab/aspnetbase:alpha
fi

echo "Done!"
