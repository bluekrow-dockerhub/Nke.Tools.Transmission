#!/bin/sh

echoInfo () {
	echo "[INFO] $1"
}

echoError () {
	echo "[ERROR] $1"
}

execute_test()
{
    EXPECTED_VALUE=$1
    ACTUAL_VALUE=$2
    TEST_TITLE=$3
    
    echo
    echo TEST: $TEST_TITLE
    echo "Expected value: $EXPECTED_VALUE"
    echo "Actual value: $ACTUAL_VALUE"
    if [ "$ACTUAL_VALUE" = "$EXPECTED_VALUE" ]; then 
        echoInfo "Test result: SUCCESS"
    else
        echoError "Test result: FAILED"
        exit 1
    fi
}

echo
echo ------------------
echo INITIALIZE TESTING
echo ------------------

NIX_TITLE="INSTALLED_OS"
NIX_OS="alpine"
RESULT_OS=$(cat /etc/os-release | grep '^ID=' | sed -e 's/^ID=//' )
execute_test $NIX_OS $RESULT_OS $NIX_TITLE

exit 0