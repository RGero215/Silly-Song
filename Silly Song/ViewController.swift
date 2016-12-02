//
//  ViewController.swift
//  Silly Song
//
//  Created by Ramon Geronimo on 12/2/16.
//  Copyright © 2016 Ramon Geronimo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let bananaFanaTemplate = [
        "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>"].joined(separator: "\n")

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameField.delegate = self
        nameField.text?.removeAll()
        lyricsView.text.removeAll()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: AnyObject) {
        nameField.text?.removeAll()
        lyricsView.text.removeAll()
    }

    @IBAction func displayLyrics(_ sender: AnyObject) {
       print(lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!))
    }
    

    func shortNameFromName(name: String) -> String {
        
        let lowercaseName = name.lowercased()
        let vowelSet = CharacterSet(charactersIn: "aeioua")
        
        if let firstVowelRange = lowercaseName.folding(options: .diacriticInsensitive, locale: .current).rangeOfCharacter(from: vowelSet, options: .caseInsensitive) {
            
            return lowercaseName.substring(from: firstVowelRange.lowerBound)
            
        } else {
            
            return lowercaseName
            
        }
    }
    
    func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
        
        let shortName = shortNameFromName(name: fullName)
        let lyrics = lyricsTemplate
            
            .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
            .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
        
        
        return lyrics
    }


}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
