//
//  HomeCoordinator.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 02.03.23.
//

import UIKit

final class HomeCoordinator: BaseCoordinator<UINavigationController> {
    
//    private var composeEmailCoordinator: ComposeEmailCoordinator?

    override func start() {
        let vc = HomeViewController.makeViewController()
        vc.coordinator = self
        rootViewController.pushViewController(vc, animated: true)
    }
    
    func coordinateToComposeEmail() { ///add navigation model
        let navigationVC = UINavigationController()
        navigationVC.navigationController?.isNavigationBarHidden = false

//        composeEmailCoordinator = ComposeEmailCoordinator(with: navigationModel,
//                                                          presentOn: navigationVC,
//                                                          rootViewController: navigationVC)
//        composeEmailCoordinator?.start()
    }
}
