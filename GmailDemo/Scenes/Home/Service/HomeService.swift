//
//  HomeService.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 03.03.23.
//

import UIKit

protocol HomeServiceable {
    func fetch() -> [Mail]
}

final class MockHomeService: HomeServiceable {
    func fetch() -> [Mail] {
        return [Mail(id: UUID(),
                 url: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/768px-Google_%22G%22_Logo.svg.png",
                     color: UIColor.getRandomColor().hexStringFromColor(),
                     sender: "Google",
                     time: "20:12",
                     title: "Heyy",
                     message: "asnfddsfma'fmdalmfadmfdamf'adfdlakf'akd'aksddsa;dksa;dkas"),
                Mail(id: UUID(),
                     url: nil,
                     color: UIColor.getRandomColor().hexStringFromColor(),
                     sender: "Mail",
                     time: "10:12",
                     title: "Title",
                     message: "sadfldsfas;fdsa;df"),
                Mail(id: UUID(),
                     url: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/VK_logo.svg/2048px-VK_logo.svg.png",
                     color: UIColor.getRandomColor().hexStringFromColor(),
                     sender: "VK",
                     time: "9:10",
                     title: "Welcome",
                     message: "asdasdasdad"),
                Mail(id: UUID(),
                     url: nil,
                     color: UIColor.getRandomColor().hexStringFromColor(),
                     sender: "Friend",
                     time: "3:20",
                     title: "Hi",
                     message: "S[djkw[[dwkdasldkwede[,w]qdkq]kdeowq]dwsaks[w'qsqs"),
        ]
    }
}

//final class HomeService: HomeServiceable { should be implemented when real services woild be added
//    func fetch() -> [Mail] {
//        return []
//    }
//}
