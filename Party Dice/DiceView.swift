//
//  DiceView.swift
//  Party Dice
//
//  Created by 周熙岩 on 2019/1/14.
//  Copyright © 2019 DoDo. All rights reserved.
//

import UIKit

class DiceView: UIView {
    
    //从lecture黏贴的，*需要更改*
    var backgroundImage: UIImage? { didSet { setNeedsDisplay() } }
    
    override func draw(_ rect: CGRect) {
        backgroundImage?.draw(in: bounds)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
