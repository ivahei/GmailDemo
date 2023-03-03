//
//  ComposeEmailService.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 03.03.23.
//

import UIKit

protocol ComposeEmailServiceable {
    func fetch()
}

final class ComposeEmailService: ComposeEmailServiceable {
    func fetch() {}
}
