//
//  ViewController.swift
//  BMICalculator
//
//  Created by keit0728 on 2020/05/30.
//  Copyright © 2020 keit0728. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var heightTextfield: UITextField!
    @IBOutlet weak var weightTextfield: UITextField!
    @IBOutlet weak var bmiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiLabel.text = ""
        textLabel.text = ""
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if heightTextfield.isFirstResponder {
            heightTextfield.resignFirstResponder()
        }
        
        if weightTextfield.isFirstResponder {
            weightTextfield.resignFirstResponder()
        }
        
    }
    
    func calculateBMI(height: Double, weight: Double) -> Double {
        return weight/((height/100)*(height/100))
    }
    
    func checkIfFat(bmi: Double) {
        if bmi < 18.0 {
            textLabel.text = "すごく痩せていますね"
        } else if bmi >= 18.0 && bmi < 25.0 {
            textLabel.text = "健康な体型です"
        } else {
            textLabel.text = "あらら、太っていますね"
        }
    }
    
    @IBAction func button_tapped(_ sender: Any) {
        let heightText = heightTextfield.text
        let weightText = weightTextfield.text
        
        guard let height = heightText, let weight = weightText else {
            return
        }
        if let heightDouble = Double(height), let weightDouble = Double(weight) {
            let bmi = calculateBMI(height: heightDouble, weight: weightDouble)
            bmiLabel.text = "BMI: \(Int(bmi))"
            checkIfFat(bmi: bmi)
        }
    }
    

}

