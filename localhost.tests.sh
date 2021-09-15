#!/bin/sh
set -eu 

echo
echo INITIALIZE CLOUD TESTING
echo ------------------------
TRX_IMAGE="trx-img"
TRX_CONTAINER="trx-cnt"
TEST_SCRIPT="dockerhub.tests.sh"
echo "TRX_IMAGE: $TRX_IMAGE"
echo "TRX_CONTAINER: $TRX_CONTAINER"
echo "TEST_SCRIPT: $TEST_SCRIPT"

echo
echo BUILD IMAGE FROM DOCKERFILE
echo ---------------------------
docker build --no-cache --quiet --tag $TRX_IMAGE .
docker images $TRX_IMAGE

echo
echo CREATE NEW CONTAINER
echo --------------------
docker run -id --name $TRX_CONTAINER $TRX_IMAGE sh
docker ps 

echo
echo COPY TEST SCRIPTS
echo -----------------
docker cp $TEST_SCRIPT $TRX_CONTAINER:$TEST_SCRIPT
echo "$TEST_SCRIPT copied into container"

echo
echo RUN CLOUD TESTS 
echo ---------------
docker exec -i $TRX_CONTAINER sh $TEST_SCRIPT

echo
echo CONTAINER TEARDOWN
echo ------------------
echo Stopping container
docker stop $TRX_CONTAINER
echo Removing container
docker rm $TRX_CONTAINER
echo Removing image 
docker rmi $TRX_IMAGE

echo
echo TESTING FINISHED
echo ________________