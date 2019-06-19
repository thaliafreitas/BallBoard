//
//  OverlayView.swift
//  BallBoard
//
//  Created by Thalia Freitas on 17/06/19.
//  Copyright © 2019 Thalia Freitas. All rights reserved.
//

import UIKit

class OverlayView: UIView {
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.cornerRadius = 14
        layer.masksToBounds = true
    }
 
}

