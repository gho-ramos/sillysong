//
//  ViewController.swift
//  sillysong
//
//  Created by Guilherme Ramos on 07/10/17.
//  Copyright © 2017 Progeekt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let generator = LyricGenerator()
    let bananaFanaTemplate = [
        "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>"].joined(separator: "\n")
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }
    
    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        guard nameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
            lyricsView.text = "Please enter a name"
            return
        }
        lyricsView.text = generator.lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
    }
}

extension ViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
