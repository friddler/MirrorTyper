//
//  WordModel.swift
//  WritingGame
//
//  Created by Frida Nilsson on 2023-03-21.
//

import Foundation

class WordList {
    
    var listOfWords : [String] = ["apple", "banana", "cat", "dog", "elephant", "flower", "grape", "house", "ice cream", "jacket", "kite", "lemon", "moon", "notebook", "orange", "pizza", "queen", "rainbow", "sun", "tree", "umbrella", "violin", "water", "xylophone", "yellow", "zebra", "ant", "boat", "carrot", "donut", "ear", "fish", "giraffe", "hat", "igloo", "jelly", "key", "lion", "map", "necklace", "octopus", "pencil", "quilt", "robot", "snake", "tiger", "unicorn", "volcano", "watch", "xylophone", "yarn", "zeppelin"]
    
    
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
