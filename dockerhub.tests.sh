#!/bin/sh

echoInfo () {
	echo -e "\e[1;32m[INFO] $1\e[0m"
}

echoError () {
	echo -e "\e[1;31m[ERROR] $1\e[0m"
}

execute_test()
{
    TEST_TITLE=$1
    EXPECTED_VALUE=$2
    ACTUAL_VALUE=$3
    
    echo
    echo -e "\e[1mTEST: $TEST_TITLE\e[0m"
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
execute_test $NIX_TITLE $NIX_OS $RESULT_OS 

TRANS_TITLE="INSTALLED_TRANSMISSION"
EXP_TRANS="/etc/conf.d/transmission-daemon"
ACTUAL_TRANS=$(ls /etc/conf.d/*)
execute_test $TRANS_TITLE $EXP_TRANS $ACTUAL_TRANS 

exit 0
