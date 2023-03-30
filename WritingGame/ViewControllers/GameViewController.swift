//
//  GameViewController.swift
//  WritingGame
//
//  Created by Frida Nilsson on 2023-03-20.
//

import UIKit

class GameViewController: UIViewController {
    
    var wordList = WordList()
    
    var roundTimer : Timer?
    var gameTimer : Timer?
    
    var timeRemaining : Int = 4
    var gameTimeRemaining : Int = 60
    var timeLeft : Int = 0
    
    var score = 0
    
    var difficulty = ""
    
    let resultSegue = "goToResultSegue"
    
    @IBOutlet weak var timeLabel: UILabel!

    @IBOutlet weak var wordLabel: UILabel!

    @IBOutlet weak var typeText: UITextField!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var gameTimerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        typeText.layer.cornerRadius = 15
        
        typeText.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        
        timeDiff()
        startGame()
        
    }
    
    
    func startGame(){
        startGameTimer()
        startRound()
    }
    
    func startRound(){
        timeRemaining = 4
        updateTimerText()
        showWord()
        typeText.text = ""
        typeText.becomeFirstResponder()
        startRoundTimer()
    }
    
    func showWord(){
        if let firstWord = wordList.getRandomWord(){
            wordLabel.text = firstWord
        }
    }
    
    @objc func textDidChange(){
        if let word = wordLabel.text, let inputWord = typeText.text,
           inputWord.count == word.count {
            wordMatch()
        }
    }
    
    func wordMatch(){
        guard let word = wordLabel.text?.lowercased(), let inputWord = typeText.text?.lowercased() else {
            return
        }
        
        if word == inputWord {
            score += 1
            scoreLabel.text = "\(score)"
            stopRoundTimer()
            startRound()
            
        } else if score > 0 {
            score -= 1
            scoreLabel.text = "\(score)"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == resultSegue {
            if let resultVC = segue.destination as? ResultViewController {
                resultVC.resultScore = score
            }
        }
    }
       
    func startRoundTimer(){
        roundTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else {return}
            self.timeRemaining -= 1
            if self.timeRemaining == 0 {
                self.stopRoundTimer()
                self.startRound()
            }
        self.updateTimerText()
        }
    }
    
    func updateTimerText(){
        timeLabel.text = "\(timeRemaining)"
        gameTimerLabel.text = "\(gameTimeRemaining)"
    
    }

    func stopRoundTimer(){
        roundTimer?.invalidate()
        roundTimer = nil
    }
    
    func startGameTimer(){
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else {return}
            self.gameTimeRemaining -= 1
            if self.gameTimeRemaining == 0 {
                self.stopGameTimer()
            
            }
        self.updateTimerText()
        }
    }
    
    func stopGameTimer(){
        gameTimer?.invalidate()
        gameTimer = nil
        performSegue(withIdentifier: resultSegue, sender: self)
        
    }
    
    func timeDiff(){
        
        if difficulty == "Easy" {
            gameTimeRemaining = 60
        } else if difficulty == "Medium" {
            gameTimeRemaining = 40
        } else {
            gameTimeRemaining = 20
        }
    }
}


