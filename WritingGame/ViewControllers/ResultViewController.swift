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
    
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultScoreLabel: UILabel!
    
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBOutlet weak var changeDiffButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playAgainButton.layer.cornerRadius = 15
        changeDiffButton.layer.cornerRadius = 15
        
        
        
        showLabels()
        showHighScore()
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateImage()
        
    }
    func animateImage(){
        let gifImage = UIImage.gifImageWithName("resultimage")
        resultImage.image = gifImage
    }
    
    func showLabels(){
        resultScoreLabel.text = "Great work! you've got \(resultScore)!\nIn diffictulty: \(diffSetting)"
        
        highScore = UserDefaults.standard.integer(forKey: diffSetting)
        highScoreLabel.text = "The highscore is: \(highScore) \nIn difficulty: \(diffSetting)"
    }
    
    func showHighScore(){
        if resultScore > highScore {
            highScore = resultScore
            UserDefaults.standard.set(highScore, forKey: diffSetting)
            highScoreLabel.text = "\(highScore)"
        }
    }
}
