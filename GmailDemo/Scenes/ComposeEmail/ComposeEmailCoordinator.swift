//
//  ComposeEmailCoordinator.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 03.03.23.
//

import UIKit

final class ComposeEmailCoordinator: BaseCoordinator<UINavigationController> {
    unowned let presentOn: UIViewController

    init(presentOn: UIViewController, rootViewController: UINavigationController) {
        self.presentOn = presentOn
        super.init(rootViewController: rootViewController)
    }
    
    override func start() {
        rootViewController.modalPresentationStyle = .overCurrentContext
        let vc = ComposeEmailViewController.makeViewController()
        vc.coordinator = self
        
        rootViewController.pushViewController(vc, animated: false)
        presentOn.present(
            rootViewController,
            animated: true)
    }
    
    override func back() {
        rootViewController.popViewController(animated: true)
        presentOn.dismiss(animated: true)
    }
}
