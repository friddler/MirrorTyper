//
//  ResultViewController.swift
//  WritingGame
//
//  Created by Frida Nilsson on 2023-03-20.
//

import UIKit

class ResultViewController: UIViewController {
    
    var resultScore = 0
    var highScore = 0
    var diffSetting = ""
    
    
    @IBOutlet weak var resultScoreLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UITextField!
    
    @IBOutlet weak var highScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nameLabel.layer.cornerRadius = 15
        
        resultScoreLabel.text = "\(resultScore)"
        
        showHighScore()
        
        
        
    }
    
    func showHighScore(){
        
        highScore = UserDefaults.standard.integer(forKey: diffSetting)
        highScoreLabel.text = "\(highScore)"
        
        if resultScore > highScore {
            highScore = resultScore
            UserDefaults.standard.set(highScore, forKey: diffSetting)
            highScoreLabel.text = "\(highScore)"
        }
        
    }
    
    
}
