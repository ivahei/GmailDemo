//
//  ComposeEmailViewModel.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 03.03.23.
//

import Combine
import UIKit

final class ComposeEmailServiceInput {
    var composeEmailService = ComposeEmailService()
    
    public init() {}
}

final class ComposeEmailViewModel: BaseViewModel<ComposeEmailServiceInput> {}
