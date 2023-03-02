//
//  ViewModel.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 02.03.23.
//

import Combine
import UIKit

protocol Bindable {
    func configureOutput()
}

class ViewModel: Bindable {

    init() {
        configureOutput()
    }

    func configureOutput() {}
}
