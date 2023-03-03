//
//  ViewModel.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 02.03.23.
//

import Combine
import UIKit

protocol ViewModel {
    func configureOutput()
}

class BaseViewModel<Service>: ViewModel {

    var service: Service

    init(service: Service) {
        self.service = service
        configureOutput()
    }

    func configureOutput() {}
}
