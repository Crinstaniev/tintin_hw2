BASE_DIR := ./src/tintin_hw2
COMPILER := moc
COMPILER_FLAG := --package base $(shell dfx cache show)/base -r

all: main

%: ${BASE_DIR}/%.mo
	${COMPILER} ${COMPILER_FLAG} $^