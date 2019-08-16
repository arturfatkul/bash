#!/bin/bash

LOW='qwertyuiopasdfghjklzxcvbnm'
CAP='QWERTYUIOPASDFGHJKLZXCVBNM'
SPECIAL='!@#$%^&*()_+{}[];:?></\|'

CHAR1=$(echo ${LOW} | fold -w1 | shuf | head -c1)
CHAR2=$(echo ${CAP} | fold -w1 | shuf | head -c1)
CHAR3=$(echo ${SPECIAL} | fold -w1 | shuf | head -c1)

ALL_CHAR1=${CHAR1}${CHAR2}${CHAR3}

CHAR4=$(echo ${LOW} | fold -w1 | shuf | head -c1)
CHAR5=$(echo ${CAP} | fold -w1 | shuf | head -c1)
CHAR6=$(echo ${SPECIAL} | fold -w1 | shuf | head -c1)

ALL_CHAR2=${CHAR4}${CHAR5}${CHAR6}

CHAR7=$(echo ${LOW} | fold -w1 | shuf | head -c1)
CHAR8=$(echo ${CAP} | fold -w1 | shuf | head -c1)
CHAR9=$(echo ${SPECIAL} | fold -w1 | shuf | head -c1)

ALL_CHAR3=${CHAR7}${CHAR8}${CHAR9}

PASSWORD=${ALL_CHAR1}${ALL_CHAR2}${ALL_CHAR3}

echo ${PASSWORD}
