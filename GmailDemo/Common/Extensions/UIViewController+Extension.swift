//
//  UIViewController+Extension.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 03.03.23.
//

import UIKit

extension UIViewController {
    func setupCloseButtonItem(imageName: String? = nil,
                              color: UIColor = .darkGray,
                              selector: Selector = #selector(closeButtonItemAction)) {
        let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: selector)

        if let imageName {
            backButtonItem.image = UIImage(named: imageName)
        } else {
            backButtonItem.image = UIImage(systemName: "xmark")
        }
    
        backButtonItem.tintColor = color
        self.navigationItem.leftItemsSupplementBackButton = false
        self.navigationItem.leftBarButtonItem = backButtonItem
    }

    @objc func closeButtonItemAction() {
        self.dismiss(animated: true, completion: nil)
    }
}
