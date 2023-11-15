//
//  UIViewExtension.swift
//  CoachApp
//
//  Created by Rishabh Sharma on 23/11/22.
//

import UIKit

extension UIView {
    
    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
    
    func addBlur() {
        var blurEffect: UIBlurEffect!
        if #available(iOS 10.0, *) {
            blurEffect = UIBlurEffect(style: .dark)
        } else {
            blurEffect = UIBlurEffect(style: .light)
        }
        let bluredEffectView = UIVisualEffectView(effect: blurEffect)
        bluredEffectView.frame = self.bounds
        bluredEffectView.alpha = 0.3
        bluredEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(bluredEffectView)
    }
}
