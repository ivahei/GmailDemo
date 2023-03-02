//
//  ViewController.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 02.03.23.
//

import Combine
import UIKit

class ViewController<ViewModel, C: Coordinator>: UIViewController {

    var viewModel: ViewModel!
    unowned var coordinator: C!

    var subscriptions = Set<AnyCancellable>()

    func setupBindings() {}
}
