#!/bin/bash

if docker images | grep aspnetbase;
then
	echo "Image already exist"
else
	echo "Image does not exist, creating it"
	mkdir /tmp/dockertmp
	cp Dockerfile.base.arm /tmp/dockertmp/Dockerfile
	docker build -t aspnetbase /tmp/dockertmp
	rm -Rf /tmp/dockertmp
fi

echo "Done!"
