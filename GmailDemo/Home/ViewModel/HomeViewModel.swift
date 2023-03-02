//
//  HomeViewModel.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 02.03.23.
//

import Combine
import UIKit

struct Mail {
    let title: String
}

final class HomeViewModel: ViewModel {
    
    @Published var mails: [Mail]?

    override func configureOutput() {
        //from API call
        mails = [Mail(title: "new")]
    }
}
