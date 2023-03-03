//
//  NSObject+Extension.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 02.03.23.
//

import UIKit

public extension NSObject {
    class var className: String {
        return String(describing: self)
    }
}
