//
//  HomeCoordinator.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 02.03.23.
//

import UIKit

final class HomeCoordinator: BaseCoordinator<UINavigationController> {
    
    override func start() {
        let vc = HomeViewController.makeViewController()
        vc.coordinator = self
        rootViewController.pushViewController(vc, animated: true)
    }
}
