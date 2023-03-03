//
//  AppCoordinator.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 02.03.23.
//

import UIKit

public final class AppCoordinator: Coordinator {

    private var window: UIWindow

    var homeCoordinator: HomeCoordinator?
    let mainNavigationController = UINavigationController()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        showMainScene()
    }

    func showMainScene() {
        mainNavigationController.isNavigationBarHidden = true
        homeCoordinator = HomeCoordinator(rootViewController: mainNavigationController)
        homeCoordinator?.start()
        window.rootViewController = homeCoordinator?.rootViewController
     }

    func back() {
        fatalError()
    }

    func backToRoot() {
        fatalError()
    }
}
