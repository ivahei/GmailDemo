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
                                                       message: mail.message,
                                                       isFavorite: mail.isFavorite,
                                                       isSeen: mail.isSeen))
        }
        mails = tempMails
    }

    func removeItem(at index: Int) {
        var temp = mails ?? []
        temp.remove(at: index)
        mails = temp
    }
    
    func selectItem(at index: Int) {
        if var mails {
            var mail = mails[index]
            mail.isSeen = true
            mails[index] = mail
            self.mails = mails
        }
    }

    func updateFavorite(with id: UUID?, isFavorite: Bool) {
        if let id, var mails, let index = mails.firstIndex(where: { $0.id == id }) {
            var mail = mails[index]
            mail.isFavorite = isFavorite
            mails[index] = mail
            self.mails = mails
        }
    }
}
