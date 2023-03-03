//
//  HomeTableViewCellModel.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 02.03.23.
//

import Foundation

struct MessageTableViewCellModel {
    var imageReference: String? = nil
    let sender: String
    let time: String
    let title: String
    let message: String
    var isFavorite: Bool = false
}
