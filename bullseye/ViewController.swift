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
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        curentValue = Int(roundedValue)
        startNewRound()
    }

    @IBAction func showAlert() {
        
        let message = "The value of the slider is \(curentValue)" +
        "\nThe target value is \(targetValue)"
        
        let alert = UIAlertController(title: "Hello, World!", message: message,
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

    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        curentValue = 50
        slider.value = Float(curentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
}

