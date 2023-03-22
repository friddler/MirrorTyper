//
//  GameViewController.swift
//  WritingGame
//
//  Created by Frida Nilsson on 2023-03-20.
//

import UIKit

class GameViewController: UIViewController {
    
    var wordModel = WordModel()
    
    var timer : Timer?
    
    var timeRemaining : Int = 4
    
    var currentRound : Int = 0
    
    var roundsInTotal : Int = 10
    
    var correctAnswers : Int = 0
    
    @IBOutlet weak var timeLabel: UILabel!

    @IBOutlet weak var wordLabel: UILabel!

    @IBOutlet weak var typeText: UITextField!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var roundsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        typeText.becomeFirstResponder()
        
        scoreLabel.text = "\(wordModel.score)"
        
        timeLabel?.text = "\(timeRemaining)"
        
        typeText.addTarget(self, action: #selector(checkWord), for: .editingDidEndOnExit)
        
        startGame()
        
    }
    
    @objc func checkWord(){
        wordMatch()
    }
    
    func startGame(){
        currentRound = 0
        roundsLabel.text = "\(currentRound)"
        correctAnswers = 0
        startRound()
    }
    
    func startRound(){
        currentRound += 1
        roundsLabel.text = "\(currentRound)"
        timeRemaining = 4
        updateTimerText()
        showWord()
        typeText.text = ""
        startTimer()
    }
    
    func showWord(){
        if let firstWord = wordModel.getRandomWord(){
            wordLabel.text = firstWord
        }
    }
    
    func wordMatch(){
        
        guard let word = wordLabel.text, let inputWord = typeText.text else {
            return
        }
        
        if word == inputWord {
            wordModel.score += 1
            scoreLabel.text = "\(wordModel.score)"
            correctAnswers += 1
            
            if currentRound < roundsInTotal {
                stopTimer()
                startRound()
            } else {
                //game over
            }
        }
    }
    func startTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else {return}
            self.timeRemaining -= 1
            if self.timeRemaining == 0 {
                self.stopTimer()
                self.startRound()
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
    
    func endGameAndGoToResult(){
        
        
    }
}


