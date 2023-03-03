//
//  BaseCoordinator.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 02.03.23.
//

import UIKit

protocol Coordinator: AnyObject {
    func start()
    func back()
    func backToRoot()
}

class BaseCoordinator<T: UIViewController>: NSObject, Coordinator {
    
    unowned var rootViewController: T
    
    init(rootViewController: T) {
        self.rootViewController = rootViewController
    }
    
    func start() { preconditionFailure() }
    func back() { preconditionFailure() }
    func backToRoot() { preconditionFailure() }
    func dismiss(with controller: UIViewController,
                 animated: Bool = true,
                 completion: (() -> Void)? = nil) {
        preconditionFailure()
    }
}

extension BaseCoordinator where T: UINavigationController {
    func back() {
        rootViewController.popViewController(animated: true)
    }
    
    func backToRoot(animated: Bool = true) {
        rootViewController.popToRootViewController(animated: animated)
    }
    
    func dismiss(with controller: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        controller.dismiss(animated: animated, completion: completion)
    }
}
