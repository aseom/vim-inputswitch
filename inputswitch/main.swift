//
//  main.swift
//  inputswitch
//
//  ASeom Han <hm9599@gmail.com>
//

import Foundation
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

func setInputSource(language: String) {
    let currentInputSource = TISCopyCurrentKeyboardInputSource().takeRetainedValue()
    if language != getInputSourceLanguage(currentInputSource) {
        
        let inputSource = TISCopyInputSourceForLanguage(language).takeRetainedValue()
        TISSelectInputSource(inputSource)
        
        // Print without newline
        print("Input Source Changed: \"" + getInputSourceName(inputSource) + "\"", terminator:"")
    }
}

if(Process.arguments.count >= 2) {
    setInputSource(Process.arguments[1])
} else {
    print("Missing argument: language code")
    exit(1)
}

