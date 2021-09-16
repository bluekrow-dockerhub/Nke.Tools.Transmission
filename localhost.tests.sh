#!/bin/sh
set -eu 

echo
echo INITIALIZE LOCAL TESTING
echo ------------------------
TRX_IMAGE="trx-img"
TRX_CONTAINER="trx-cnt"
TEST_SCRIPT="dockerhub.tests.sh"

echo
echo REBUILD IMAGE FROM DOCKERFILE
echo -----------------------------
docker build --tag $TRX_IMAGE .

echo
echo CREATE NEW CONTAINER
echo --------------------
#run options --> d:detach i:interactive t:tty
docker run -t -i --name $TRX_CONTAINER $TRX_IMAGE sh

echo
echo COPY TEST SCRIPTS
echo ------------------------
docker cp $TEST_SCRIPT $TRX_CONTAINER:$TEST_SCRIPT

echo
echo RUN CLOUD TESTS LOCALLLY
echo ------------------------
docker exec -t -i $TRX_CONTAINER sh $TEST_SCRIPT

echo
echo STOPPING CONTAINER
docker stop $TRX_CONTAINER
echo FINISHED