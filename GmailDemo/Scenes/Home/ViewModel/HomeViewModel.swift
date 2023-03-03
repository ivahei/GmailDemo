//
//  HomeViewModel.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 02.03.23.
//

import Combine
import UIKit

final class HomeServiceInput {
    var homeService = MockHomeService()
    
    public init() {}
}

final class HomeViewModel: BaseViewModel<HomeServiceInput>, ObservableObject {
    
    @Published private(set) var mails: [MessageTableViewCellModel]?

    override func configureOutput() {
        var tempMails = [MessageTableViewCellModel]()
        service.homeService.fetch().forEach { mail in
            let color = UIColor(hex: mail.color) ?? UIColor.getRandomColor()
            tempMails.append(MessageTableViewCellModel(id: mail.id,
                                                       imageReference: mail.url,
                                                       avatarColor: color,
                                                       sender: mail.sender,
                                                       time: mail.time,
                                                       title: mail.title,
                                                       message: mail.message))
        }
        mails = tempMails
    }
    
    func removeItem(at index: Int) {
        var temp = mails ?? []
        temp.remove(at: index)
        mails = temp
    }
}
