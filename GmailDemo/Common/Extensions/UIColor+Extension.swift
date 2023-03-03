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

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b: CGFloat
        var a: CGFloat = 1

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
    
    func hexStringFromColor() -> String {
        let components = self.cgColor.components
        let r: CGFloat = components?[0] ?? 0.0
        let g: CGFloat = components?[1] ?? 0.0
        let b: CGFloat = components?[2] ?? 0.0
        
        let hexString = String.init(format: "#%02lX%02lX%02lX",
                                    lroundf(Float(r * 255)),
                                    lroundf(Float(g * 255)),
                                    lroundf(Float(b * 255)))
        return hexString
    }
}
