//
//  ViewController.swift
//  WritingGame
//
//  Created by Frida Nilsson on 2023-03-20.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    

    @IBOutlet weak var animatedLabel: UILabel!
    
    @IBOutlet weak var chooseDiff: UIPickerView!
    
    var difficulty = ["Easy", "Medium", "Hard"]
    
    var choosenDiff = ""
    
    let gameSegue = "startGameSegue"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseDiff.dataSource = self
        chooseDiff.delegate = self
        
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
                RunLoop.current.run(until: Date()+0.2)
            }
        }
    }
    
    @IBAction func startGameButton(_ sender: UIButton) {
        performSegue(withIdentifier: gameSegue, sender: self)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return difficulty.count
    }
        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return difficulty[row]
    }
    //changes the color of the text in pickerview
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        let attributedString = NSAttributedString(string: difficulty[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        return attributedString
    }
   
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        choosenDiff = difficulty[row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gameViewVC = segue.destination as? GameViewController {
            gameViewVC.difficulty = choosenDiff
        }
    }
}






