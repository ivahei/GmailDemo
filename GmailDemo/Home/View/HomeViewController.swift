//
//  HomeViewController.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 02.03.23.
//

import UIKit

final class HomeViewController: ViewController<HomeViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.$mails.sink { emails in
             
        }.store(in: &subscriptions)
    }
}
