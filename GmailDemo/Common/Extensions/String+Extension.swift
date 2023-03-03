//
//  String+Extension.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 02.03.23.
//

import UIKit

extension String {
    func getFirstLetter() -> String {
        if let firstLetter = self.first?.uppercased() {
            return String(firstLetter)
        }
        return ""
    }
}
