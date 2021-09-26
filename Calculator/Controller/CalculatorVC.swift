//
//  ViewController.swift
//  Calculator
//
//  Created by MacBook on 15.09.2021.
//

import UIKit

class CalculatorVC: UIViewController {
    
    var calculatingLogic = CalculatingLogic()
    
    @IBOutlet weak var displayLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func actionButtonPressed(_ sender: UIButton) {
        
        guard let action = sender.currentTitle else { return }
        
        // dispatch data to CalculatingLogic VC
        calculatingLogic.action(action)
        displayLabel.text = calculatingLogic.label
        
    }
    
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        guard let number = sender.currentTitle else { return }
        
        calculatingLogic.number(number)
        displayLabel.text = calculatingLogic.label
        

    }
}


