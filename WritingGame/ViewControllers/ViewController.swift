//
//  ViewController.swift
//  WritingGame
//
//  Created by Frida Nilsson on 2023-03-20.
//

import UIKit

class ViewController: UIViewController {
    
    let gameSegue = "startGameSegue"

    
    @IBOutlet weak var animatedLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        //when startButton is pressed, go to new view, start the timer and show the first word.
        // function that starts the game and get the words from list
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animation()
    }
    
    func animation(){
        if let text = animatedLabel.text {
            var newText = ""
            for char in text {
                newText += String(char)
                animatedLabel.text = newText
                RunLoop.current.run(until: Date()+0.3)
            }
        }
    }
    
    @IBAction func startGameButton(_ sender: UIButton) {
        
    }
    
    
    @IBAction func scoreButton(_ sender: UIButton) {
        
    }
    
    
    func displayHighScore(){
        
        
    }
    
    

    
}






