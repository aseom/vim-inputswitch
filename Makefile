.PHONY: all clean

all:
	mkdir -p bin
	/usr/bin/swiftc inputswitch/main.swift -o bin/inputswitch

clean:
	rm -rf bin
