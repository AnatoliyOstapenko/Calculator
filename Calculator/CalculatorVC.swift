//
//  ViewController.swift
//  Calculator
//
//  Created by MacBook on 15.09.2021.
//

import UIKit

class CalculatorVC: UIViewController {
    
    var line = ""
    
    @IBOutlet weak var displayLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func actionButtonPressed(_ sender: UIButton) {
        
        guard let action = sender.currentTitle else { return }
        
        switch action {
        case "AC":
            displayLabel.text = "0"
            line = ""
        case "+":
            displayLabel.text = "Ooops"
        default:
            displayLabel.text = "0"

        }
    }
    
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        guard let number = sender.currentTitle else { return }
        
        line += number
        
        displayLabel.text = line
        
        
                
        
        
        
    }
    
    

}

