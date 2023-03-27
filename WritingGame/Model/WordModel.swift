//
//  WordModel.swift
//  WritingGame
//
//  Created by Frida Nilsson on 2023-03-21.
//

import Foundation

class WordModel {
    
    var listOfWords : [String] = ["Frida", "Rune", "Bosse","Nisse", "Johnny", "Bob", "Kalle", "Uffe", "Burken", "Bulten", "Peter", "Ronny", "Raffe", "Kaffe"]
    var score : Int = 10
    
    func getRandomWord() -> String? {
        if listOfWords.isEmpty {
            return nil
        }
        let randomIndex = Int.random(in: 0..<listOfWords.count)
        let randomWord = listOfWords[randomIndex]
        listOfWords.remove(at: randomIndex)
        return randomWord
    }
    

   
}
