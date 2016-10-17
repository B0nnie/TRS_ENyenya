//
//  CAGradientLayer+Convenience.swift
//  TRS_ENyenya
//
//  Created by Ebony Nyenya on 10/16/16.
//  Copyright © 2016 Ebony Nyenya. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    
    func aquaMarineColor() -> CAGradientLayer{
        
        let topColor = UIColor(red: 26/255.0, green: 41/255.0, blue: 128/255.0, alpha: 0.7)
        let bottomColor = UIColor(red: 38/255.0, green: 208/255.0, blue: 206/255.0, alpha: 1)
        
        let gradientColors = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations = [0.0, 1.0]
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations as [NSNumber]?
        
        return gradientLayer
    }
    
}
