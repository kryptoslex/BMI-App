//
//  Rounded.swift
//  BMI App
//
//  Created by Michael Jay Abalos on 29/09/2017.
//  Copyright © 2017 Michael Jay Abalos. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func awakeFromNib() {
        self.layer.cornerRadius = 25
        self.clipsToBounds = true
    }
}
