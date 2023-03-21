//
//  GameViewController.swift
//  WritingGame
//
//  Created by Frida Nilsson on 2023-03-20.
//

import UIKit

class GameViewController: UIViewController {
    
    let wordModel = WordModel()
    
    var timer : Timer?
    
    var timeRemaining : Int = 4
    
    
    @IBOutlet weak var timeLabel: UILabel!

    @IBOutlet weak var wordLabel: UILabel!

    @IBOutlet weak var typeText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        typeText.becomeFirstResponder()
        
        timeLabel?.text = "\(timeRemaining)"
        startTimer()
        showWord()
        
    
        
    }
    
    
    func showWord(){
        if let firstWord = wordModel.getRandomWord(){
            wordLabel.text = firstWord
        }
    }
    
    func updateWord(){
        if let nextWord = wordModel.getNextWord(){
            wordLabel.text = nextWord
        } else {
            
        }
    }
    
    func isWordCorrect(){
        
        
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else {return}
            self.timeRemaining -= 1
            if self.timeRemaining == 0 {
                self.stopTimer()
            }
            self.updateTimerText()
        }
    }
    
    func updateTimerText(){
        timeLabel.text = "\(timeRemaining)"
        
    }
    
    func stopTimer(){
        timer?.invalidate()
        timer = nil
        
    }
}



/*
 if word is correct - > continue -> restart timer ->
 else if word is wrong - > end
  X a variable that holds the time.
  X func that starts the timer
  X func that ends the timer
 
 when word is typed and correct, next word should come and score +1, when word is typed wrong, game ends.
 
 */
