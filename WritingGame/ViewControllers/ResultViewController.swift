//
//  ResultViewController.swift
//  WritingGame
//
//  Created by Frida Nilsson on 2023-03-20.
//

import UIKit

class ResultViewController: UIViewController {
    

    @IBOutlet weak var resultScore: UILabel!
    
    var score : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         resultScore.text = "You got \(score) nice!"
        

        

        
        
        
        
    }
    
    

}
