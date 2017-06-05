//
//  InsetLabel.swift
//  chat_view
//
//  Created by Dakshesh patel on 6/3/17.
//  Copyright © 2017 Dakshesh patel. All rights reserved.
//

import UIKit

class InsetLabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: UIEdgeInsetsInsetRect(rect, UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 0)))
    }

}
