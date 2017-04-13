//
//  SVNMaterialButton.swift
//  SVNLargeButton
//
//  Created by Aaron Dean Bikis on 4/7/17.
//  Copyright © 2017 7apps. All rights reserved.
//

import UIKit

public class SVNMaterialButton: UIButton {
    
    public init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        self.backgroundColor = color
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 8
        self.layer.shadowOffset = CGSize(width: 8.0, height: 8.0)
    }
    
    public init(layoutInBottomOfContainer container: CGRect, color: UIColor){
        super.init(frame: CGRect(x: 45, y: container.size.height - (35 + 65), width: container.size.width - 45 * 2, height: 65))
        self.backgroundColor = color
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 8
        self.layer.shadowOffset = CGSize(width: 8.0, height: 8.0)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("This class is not set up to be instaciated with coder use init(frame) instead")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height / 4
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.animate(to: 0.5, and: CGSize(width: 5.0, height: 5.0), with: 0.5)
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.animate(to: 0.8, and: CGSize(width: 8.0, height: 8.0), with: 0.5)
    }
    
    private func animate(to opacity: Double, and offset: CGSize, with duration: Double){
        CATransaction.begin()
        let opacityAnimation = CABasicAnimation(keyPath: "shadowOpacity")
        opacityAnimation.toValue = opacity
        opacityAnimation.duration = duration
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        opacityAnimation.fillMode = kCAFillModeBoth
        opacityAnimation.isRemovedOnCompletion = false
        
        let offsetAnimation = CABasicAnimation(keyPath: "shadowOffset")
        offsetAnimation.toValue = offset
        offsetAnimation.duration = duration
        offsetAnimation.timingFunction = opacityAnimation.timingFunction
        offsetAnimation.fillMode = opacityAnimation.fillMode
        offsetAnimation.isRemovedOnCompletion = false
        
        self.layer.add(offsetAnimation, forKey: offsetAnimation.keyPath!)
        self.layer.add(opacityAnimation, forKey: opacityAnimation.keyPath!)
        CATransaction.commit()
    }
}
