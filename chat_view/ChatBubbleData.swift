//
//  ChatBubbleData.swift
//  chat_view
//
//  Created by Dakshesh patel on 6/3/17.
//  Copyright © 2017 Dakshesh patel. All rights reserved.
//

import Foundation
import UIKit
enum BubbleDataType: Int{
    case Mine = 0
    case Opponent
}

/// DataModel for maintaining the message data for a single chat bubble
class ChatBubbleData {
    
    // 2.Properties
    var text: String?
    var image: UIImage?
    var date: NSDate?
    var type: BubbleDataType
    
    // 3. Initialization
    init(text: String?,image: UIImage?,date: NSDate? , type:BubbleDataType = .Mine) {
        // Default type is Mine
        self.text = text
        self.image = image
        self.date = date
        self.type = type
    }
}

extension UIImage {
    func resizableImageWithStretchingProperties(
        X X: CGFloat, width widthProportion: CGFloat,
        Y: CGFloat, height heightProportion: CGFloat) -> UIImage {
        
        let selfWidth = self.size.width
        let selfHeight = self.size.height
        
        // insets along width
        let leftCapInset = X*selfWidth*(1-widthProportion)
        let rightCapInset = (1-X)*selfWidth*(1-widthProportion)
        
        // insets along height
        let topCapInset = Y*selfHeight*(1-heightProportion)
        let bottomCapInset = (1-Y)*selfHeight*(1-heightProportion)
        
        return self.resizableImage(
            withCapInsets: UIEdgeInsets(top: topCapInset, left: leftCapInset,
                         bottom: bottomCapInset, right: rightCapInset),
            resizingMode: .stretch)
    }
}

extension UITableView {
    func scrollToBottom(animated: Bool) {
        let y = contentSize.height - frame.size.height - 50
        setContentOffset(CGPoint(x: 0, y: (y<0) ? 0 : y), animated: animated)
    }
}

