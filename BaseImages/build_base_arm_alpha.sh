#!/bin/bash

if docker images | grep aspnetbase_alpha;
then
	echo "Image already exist"
else
	echo "Image does not exist, creating it"
	mkdir /tmp/dockertmp
	cp Dockerfile.base.arm_alpha /tmp/dockertmp/Dockerfile
	docker build -t aspnetbase_alpha /tmp/dockertmp
	rm -Rf /tmp/dockertmp
fi

echo "Done!"
