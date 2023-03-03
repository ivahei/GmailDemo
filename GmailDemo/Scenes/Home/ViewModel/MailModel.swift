//
//  MailModel.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 03.03.23.
//

import UIKit

struct Mail: Codable {
    let id: UUID
    var url: String? = nil
    let color: String
    let sender: String
    let time: String
    let title: String
    let message: String
    var isFavorite: Bool = false
}
