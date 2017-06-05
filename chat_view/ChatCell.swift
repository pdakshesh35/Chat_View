//
//  ChatCell.swift
//  chat_view
//
//  Created by Dakshesh patel on 6/3/17.
//  Copyright © 2017 Dakshesh patel. All rights reserved.
//

import Foundation
import UIKit

class ChatCell: UITableViewCell {

   
    @IBOutlet weak var bgview: UIView!
   var chat = UILabel()
    var txt : CGFloat?
   var chatBubbleMine : UIView!
    var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
                
       
              
        
        //dp custome view
        
        //radius affect only certain corners
        let path = UIBezierPath(roundedRect:bgview.bounds,
                                byRoundingCorners:[.topLeft, .bottomRight, .bottomLeft],
                                cornerRadii: CGSize(width: 5, height:  5))
        
        let maskLayer = CAShapeLayer()
        
        maskLayer.path = path.cgPath
        bgview.layer.mask = maskLayer
       
     
        
        
        // Initialization code
    }
    
    
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
