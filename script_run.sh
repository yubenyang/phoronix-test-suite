#!/bin/bash

RESULT_DIR=$1
TEST_NAME=$2
PHORONIX=./phoronix-test-suite

${PHORONIX} install ${TEST_NAME} > "${RESULT_DIR}/install_${TEST_NAME}.txt"
mkdir /sys/fs/cgroup/phoronix

echo $$ > /sys/fs/cgroup/phoronix/cgroup.procs
${PHORONIX} batch-run ${TEST_NAME} > "${RESULT_DIR}/result_${TEST_NAME}.txt"
cat /sys/fs/cgroup/phoronix/memory.peak > "${RESULT_DIR}/mem_${TEST_NAME}.txt"

echo $$ > /sys/fs/cgroup/cgroup.procs
rmdir /sys/fs/cgroup/phoronix
yes | ${PHORONIX} remove-installed-test ${TEST_NAME} > "${RESULT_DIR}/uninstall_${TEST_NAME}.txt"
rm -rf /mnt/sdb/yuben/phoronix-test-suite/installed-tests/*/${TEST_NAME}*