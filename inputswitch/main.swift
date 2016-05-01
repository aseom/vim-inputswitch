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

if Process.arguments.count == 2 && Process.arguments[1] == "--get" {
    let currentInputSource = TISCopyCurrentKeyboardInputSource().takeRetainedValue()
    print(getInputSourceLanguage(currentInputSource), terminator:"")  // No newline

} else if Process.arguments.count == 3 && Process.arguments[1] == "--set" {
    let language = Process.arguments[2]
    let inputSource = TISCopyInputSourceForLanguage(language).takeRetainedValue()
    TISSelectInputSource(inputSource)

} else {
    exit(1)
}
