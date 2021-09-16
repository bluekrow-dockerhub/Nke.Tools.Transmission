#!/bin/sh
set -eu 

echo
echo INITIALIZE LOCAL TESTING
echo ------------------------
TRX_IMAGE="trx-img"
TRX_CONTAINER="trx-cnt"
TEST_SCRIPT="dockerhub.tests.sh"
echo "TRX_IMAGE: $TRX_IMAGE"
echo "TRX_CONTAINER: $TRX_CONTAINER"
echo "TEST_SCRIPT: $TEST_SCRIPT"

echo
echo BUILD IMAGE FROM DOCKERFILE
echo -----------------------------
docker build --tag $TRX_IMAGE .
docker images $TRX_IMAGE --quiet

echo
echo CREATE NEW CONTAINER
echo --------------------
docker run -id --name $TRX_CONTAINER $TRX_IMAGE sh
docker ps 

echo
echo COPY TEST SCRIPTS
echo ------------------------
docker cp $TEST_SCRIPT $TRX_CONTAINER:$TEST_SCRIPT
docker exec -i $TRX_CONTAINER sh "ls -lha"


echo
echo RUN CLOUD TESTS LOCALLLY
echo ------------------------
docker exec -i $TRX_CONTAINER sh $TEST_SCRIPT

echo
echo STOPPING CONTAINER
docker stop $TRX_CONTAINER
echo FINISHED