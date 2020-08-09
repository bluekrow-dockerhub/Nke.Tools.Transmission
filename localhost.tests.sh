#!/bin/sh

echo
echo INITIALIZE LOCAL TESTING
echo ------------------------
TRX_IMAGE="trx-img"
TRX_CONTAINER="trx-cnt"
TEST_SCRIPT="dockerhub.tests.sh"

echo
echo REMOVING CONTAINERS AND IMAGES
echo ------------------------------
docker stop $TRX_CONTAINER
docker rm $TRX_CONTAINER
if [ "$1" = "no-cache" ]; then 
    echo "Enforcing option $1"
    sudo docker rmi $TRX_IMAGE
fi 

echo
echo REBUILD IMAGE FROM DOCKERFILE
echo -----------------------------
docker build --tag $TRX_IMAGE .

echo
echo CREATE NEW CONTAINER
echo --------------------
#run options --> d:detach i:interactive t:tty
docker run -d -it --name $TRX_CONTAINER $TRX_IMAGE sh

echo
echo RUN CLOUD TESTS LOCALLLY
echo ------------------------
docker cp $TEST_SCRIPT $TRX_CONTAINER:$TEST_SCRIPT
docker exec -it $TRX_CONTAINER sh $TEST_SCRIPT

echo
echo STOPPING CONTAINER
docker stop $TRX_CONTAINER
echo FINISHED