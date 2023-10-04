#!/bin/bash

DOCKERFILE=Dockerfile.noetic
IMAGE_NAME=camera_calibration

ros_distro="noetic"
distro="focal"
build_args=""
for (( i=1; i<=$#; i++));
do
  param="${!i}"
  echo $param

  if [ "$param" == "--bionic" ]; then
    distro="bionic"
    ros_distro="melodic"
  fi

  if [ "$param" == "--focal" ]; then
    distro="focal"
    ros_distro="noetic"
  fi

  if [ "$param" == "--dockerfile" ]; then
    j=$((i+1))
    DOCKERFILE="${!j}"
  fi

  if [ "$param" == "--image-name" ]; then
    j=$((i+1))
    IMAGE_NAME="${!j}"
  fi

  if [ "$param" == "--build-args" ]; then
    j=$((i+1))
    build_args="${!j}"
  fi

done

echo "Building $IMAGE_NAME image for $ros_distro / $distro with additional docker arguments $build_args."
echo "Dockerfile: $DOCKERFILE"

# export BUILDKIT_PROGRESS=plain
export DOCKER_BUILDKIT=1
docker build \
    $build_args \
    --build-arg ROS_DISTRO=$ros_distro \
    --build-arg DISTRO=$distro \
    -f $DOCKERFILE \
    --ssh default \
    -t $IMAGE_NAME:$distro .