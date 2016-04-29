.PHONY: all clean

all: inputswitch

inputswitch: main.swift
	mkdir -p ../bin
	/usr/bin/swiftc $^ -o ../bin/$@

clean:
	rm -rf ../bin
