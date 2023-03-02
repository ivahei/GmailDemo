//
//  ViewController.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 02.03.23.
//

import Combine
import UIKit

class ViewController<ViewModel>: UIViewController {
    
    var viewModel: ViewModel!
    var subscriptions = Set<AnyCancellable>()
    
    func setupBindings() {}
    ///
}
