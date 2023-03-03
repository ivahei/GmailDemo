//
//  HomeTableViewCellModel.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 02.03.23.
//

import UIKit

struct MessageTableViewCellModel: Equatable {
    let id: UUID
    var imageReference: String? = nil
    let avatarColor: UIColor
    let sender: String
    let time: String
    let title: String
    let message: String
    var isFavorite: Bool
    var isSeen: Bool
}
