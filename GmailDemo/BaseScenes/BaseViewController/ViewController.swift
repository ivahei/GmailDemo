//
//  ViewController.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 02.03.23.
//

import Combine
import UIKit

class ViewController<VM: ViewModel, C: Coordinator>: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
    }

    var viewModel: VM!
    unowned var coordinator: C!

    var subscriptions = Set<AnyCancellable>()

    func setupBindings() {}
}
