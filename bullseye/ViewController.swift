//
//  ViewController.swift
//  bullseye
//
//  Created by Zach Howes on 5/8/19.
//  Copyright © 2019 Zach Howes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var curentValue: Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlert() {
        
        let message = "The value of the slider is \(curentValue)"
        
        let alert = UIAlertController(title: "Hello, World!", message: message,
                                      preferredStyle: .alert )
        
        let action = UIAlertAction(title: "Awesome",
                                   style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        let roundedValue = slider.value.rounded()
        curentValue = Int(roundedValue)
    }

}

