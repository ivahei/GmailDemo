//
//  ComposeEmailViewController.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 03.03.23.
//

import UIKit

final class ComposeEmailViewController: ViewController<ComposeEmailViewModel, ComposeEmailCoordinator> {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        setupCloseButtonItem()
    }
}

extension ComposeEmailViewController {
    static func makeViewController() -> ComposeEmailViewController {
        
        let viewController = ComposeEmailViewController()
        viewController.viewModel = ComposeEmailViewModel(service: ComposeEmailServiceInput())
        
        return viewController
    }
}
