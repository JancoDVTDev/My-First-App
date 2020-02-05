//
//  customButton.swift
//  Hello World App
//
//  Created by Janco Erasmus on 2020/02/05.
//  Copyright © 2020 DVT. All rights reserved.
//

import UIKit

class customButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupButton() {
        setTitleColor(Colors.csBlack, for: .normal)
        
        setGradientBackground(colorOne: Colors.csBlue, colorTwo: Colors.csLightBlue)
        titleLabel?.font    = UIFont(name: "Verdana", size: 20)
        titleLabel?.font    = UIFont.boldSystemFont(ofSize: 20)
        layer.cornerRadius  = frame.size.height/2
        
        shakeAnimation()
//        layer.borderWidth   = 3.0
//        layer.borderColor   = UIColor.darkGray.cgColor
    }
    
    func shakeAnimation() {
        let key: String = "position"
        let shake           = CABasicAnimation(keyPath: key)
        shake.duration      = 0.1
        shake.repeatCount   = 2
        shake.autoreverses  = true
        
        let fromPoint = CGPoint(x: center.x - 8, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 8, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue   = toValue
        
        layer.add(shake, forKey: key)
    }
    
}
