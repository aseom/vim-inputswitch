//
//  main.swift
//  inputswitch
//
//  ASeom Han <hm9599@gmail.com>
//

import Carbon

func getInputSourceLanguage(inputSource: TISInputSource) -> String {
    let ptr = TISGetInputSourceProperty(inputSource, kTISPropertyInputSourceLanguages)
    let cfLangs: CFArray = Unmanaged.fromOpaque(COpaquePointer(ptr)).takeUnretainedValue()

    return (cfLangs as Array)[0] as! String
}

func getInputSourceName(inputSource: TISInputSource) -> String {
    let ptr = TISGetInputSourceProperty(inputSource, kTISPropertyLocalizedName)
    let cfName: CFString = Unmanaged.fromOpaque(COpaquePointer(ptr)).takeUnretainedValue()

    return cfName as String
}

func getCommand() {
    let currentInputSource = TISCopyCurrentKeyboardInputSource().takeRetainedValue()
    print(getInputSourceLanguage(currentInputSource), terminator:"")
}

func setCommand(language: String) {
    let currentInputSource = TISCopyCurrentKeyboardInputSource().takeRetainedValue()
    if language != getInputSourceLanguage(currentInputSource) {

        let inputSource = TISCopyInputSourceForLanguage(language).takeRetainedValue()
        TISSelectInputSource(inputSource)

        // Print without newline
        print("Input Source Changed: \"" + getInputSourceName(inputSource) + "\"", terminator:"")
    }
}

if Process.arguments.count == 2 && Process.arguments[1] == "--get" {
    getCommand()

} else if Process.arguments.count == 3 && Process.arguments[1] == "--set" {
    setCommand(Process.arguments[2])

} else {
    exit(1)
}
