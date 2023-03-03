//
//  UIColor+Extension.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 02.03.23.
//

import UIKit

extension UIColor {
    static func getRandomColor() -> UIColor {
        var red = CGFloat.random(in: 0...1)
        var green = CGFloat.random(in: 0...1)
        var blue = CGFloat.random(in: 0...1)
        let brightnessThreshold: CGFloat = 0.7

        // Check if the color is too bright and adjust it
        while (red + green + blue) / 3 > brightnessThreshold {
            red = CGFloat.random(in: 0...1)
            green = CGFloat.random(in: 0...1)
            blue = CGFloat.random(in: 0...1)
        }

        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    func whiter(by percentage: CGFloat = 50) -> UIColor {
        
        let multiplier = percentage / 100
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return UIColor(red: min(red + multiplier, 1),
                       green: min(green + multiplier, 1),
                       blue: min(blue + multiplier, 1),
                       alpha: alpha)
    }
}
