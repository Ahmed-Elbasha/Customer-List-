//
//  Color.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/8/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class Color: NSObject {
    var red: CGFloat!
    var green: CGFloat
    var blue: CGFloat
    var alpha: CGFloat
    
    
    init(red: CGFloat, blue: CGFloat, green: CGFloat, alpha: CGFloat) {
        self.red = red
        self.blue = blue
        self.green = green
        self.alpha = alpha
    }
}
