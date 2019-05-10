//
//  ViewController.swift
//  bullseye
//
//  Created by Zach Howes on 5/8/19.
//  Copyright © 2019 Zach Howes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var curentValue: Int = 0
    var targetValue: Int = 0
    var totalScore:Int = 0
    var roundNums:Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        curentValue = Int(roundedValue)
        roundNums = 1
        roundLabel.text = String(roundNums)
        startNewRound()
    }

    @IBAction func showAlert() {
        let difference: Int = abs(targetValue - curentValue)
        var points:Int = 100 - difference
        if (points == 100){
            points *= 2
        }
        totalScore += points
        let message = "You scored \(points) points"
        
        let alertTitle:String
        if (difference == 0){
            alertTitle = "Perfect!"
        } else if (difference <= 5){
            alertTitle = "So close"
        } else if (difference <= 10){
            alertTitle = "Pretty good!"
        }else {
            alertTitle = "Not even close..."
        }
        
        let alert = UIAlertController(title: alertTitle, message: message,
                                      preferredStyle: .alert )
        
        let action = UIAlertAction(title: "Awesome",
                                   style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        let roundedValue = slider.value.rounded()
        curentValue = Int(roundedValue)
    }
    
    @IBAction func gameInfo(){
        let intruct = "Your goal is to get the slider as close to the given number as possible"
        let instructAlert = UIAlertController(title: "Instructions", message: intruct, preferredStyle: .alert)
        let gotIt = UIAlertAction(title: "Got It!!!!",
                                   style: .default, handler: nil)
        instructAlert.addAction(gotIt)
        present(instructAlert,animated: true,completion: nil)
    }
    
    @IBAction func restart() {
        totalScore = 0
        roundNums = 1
        updateLabels()
    }

    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        curentValue = 50
        slider.value = Float(curentValue)
        updateLabels()
        roundNums+=1
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(totalScore)
        roundLabel.text = String(roundNums)
    }
}

