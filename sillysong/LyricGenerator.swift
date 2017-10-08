//
//  LyricGenerator.swift
//  sillysong
//
//  Created by Guilherme Ramos on 07/10/17.
//  Copyright © 2017 Progeekt. All rights reserved.
//

import Foundation

class LyricGenerator {
    
    func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
        let lyric = lyricsTemplate
            .replacingOccurrences(of: "<SHORT_NAME>", with: shortNameFromName(name: fullName))
            .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        return lyric
    }
    
    func shortNameFromName(name:String) -> String {
        let name = name.lowercased()
        let vowels = CharacterSet(charactersIn: "aeioöu")
        let nameRange = Range(uncheckedBounds: (lower: name.startIndex, upper: name.endIndex))
        if let nameIndex = name.rangeOfCharacter(from: vowels, options: .caseInsensitive, range: nameRange), nameIndex.lowerBound >= name.startIndex {
            return name.substring(from: nameIndex.lowerBound)
        }
        return name
    }
}
