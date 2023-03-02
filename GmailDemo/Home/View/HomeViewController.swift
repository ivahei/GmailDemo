//
//  HomeViewController.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 02.03.23.
//

import Combine
import UIKit

final class HomeViewController: ViewController<HomeViewModel, HomeCoordinator> {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.$mails.sink { emails in
        }.store(in: &subscriptions)
    }
    
    static func makeViewController() -> HomeViewController {
        
        let viewController = HomeViewController()
        viewController.viewModel = HomeViewModel()
        
        return viewController
    }
}
