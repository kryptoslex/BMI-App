//
//  ViewController.swift
//  BMI App
//
//  Created by Michael Jay Abalos on 29/09/2017.
//  Copyright © 2017 Michael Jay Abalos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var inputWeight: UITextField!
    @IBOutlet weak var inputFeet: UITextField!
    @IBOutlet weak var inputInches: UITextField!
    @IBOutlet weak var result: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        result.isHidden = true
        inputWeight.delegate = self
        inputFeet.delegate = self
        inputInches.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func processBMI(weight: String?, feet: String?, inches: String?) {
        
        if let kg = weight, let inputFeet = feet, let inputInches = inches{
            
            
            let meters = (Float(inputFeet)! * 12 + Float(inputInches)!) * 0.0254
            let BMI:Float = Float(kg)! / (pow(meters, 2))
        
            result.isHidden = false
            var category = ""
            if BMI < 18.5{
                category =  "UNDERWEIGHT"
                result.backgroundColor = BackgroundColors.init(hex:ResultColors.Under)
            }else if BMI >= 18.5 && BMI < 24.9{
                category =  "NORMAL"
                result.backgroundColor = BackgroundColors.init(hex:ResultColors.Normal)
            }else if BMI >= 24.9 && BMI < 29.9{
                category =  "OVER WEIGHT"
                result.backgroundColor = BackgroundColors.init(hex:ResultColors.Over)
            }else if BMI >= 29.9 && BMI < 34.9{
                category =  "OBESE"
                result.backgroundColor = BackgroundColors.init(hex:ResultColors.Obese)
            }else {
                category =  "EXTREMELY OBESE"
                result.backgroundColor = BackgroundColors.init(hex:ResultColors.Extreme)
            }
            
            result.text = "\(category) - BMI: \(String.init(format: "%.2f", BMI))"
        }

    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        
        processBMI(weight: inputWeight.text, feet: inputFeet.text, inches: inputInches.text)

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}

