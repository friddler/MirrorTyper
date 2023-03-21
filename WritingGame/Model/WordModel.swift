//
//  WordModel.swift
//  WritingGame
//
//  Created by Frida Nilsson on 2023-03-21.
//

import Foundation

class WordModel {
    
    var listOfWords : [String] = ["Frida", "Rune", "Tuffis"]
    var indexOfWord : Int = 0
    var score : Int = 0
    
    
    
   
    func getRandomWord() -> String? {
        let randomizedWords = listOfWords.shuffled()
        guard let randomWord = randomizedWords.first else {
            return nil
        }
        return randomWord
        
    }
    
    func getNextWord() -> String? {
        if indexOfWord < listOfWords.count {
            let nextWord = listOfWords[indexOfWord]
            indexOfWord += 1
            return nextWord
        } else {
            return nil
        }
    }
}
