//
//  sillysongTests.swift
//  sillysongTests
//
//  Created by Guilherme Ramos on 07/10/17.
//  Copyright © 2017 Progeekt. All rights reserved.
//

import XCTest
@testable import sillysong

class sillysongTests: XCTestCase {
    var generator:LyricGenerator!
    
    override func setUp() {
        super.setUp()
        generator = LyricGenerator()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShortNameFromName() {
        let actual = generator.shortNameFromName(name: "Zöe")
        
        XCTAssertEqual(actual, "öe")
    }
    
    func testCustomizingTemplate() {
        let bananaFanaTemplate = [
            "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
            "Banana Fana Fo F<SHORT_NAME>",
            "Me My Mo M<SHORT_NAME>",
            "<FULL_NAME>"].joined(separator: "\n")
        let actual = generator.lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: "Nate")
        let expected = [
            "Nate, Nate, Bo Bate",
            "Banana Fana Fo Fate",
            "Me My Mo Mate",
            "Nate"].joined(separator: "\n")
        print(actual)
        XCTAssertEqual(actual, expected)
    }
    
}
