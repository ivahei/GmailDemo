//
//  MessageTableViewCell.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 02.03.23.
//

import UIKit

protocol MessageCellInteractionDelegate: AnyObject {
    func didTapOnFavorite(id: UUID?, isFavorite: Bool)
}

final class MessageTableViewCell: UITableViewCell {

    @IBOutlet private weak var avatarView: AvatarView!
    @IBOutlet private weak var sender: UILabel!
    @IBOutlet private weak var time: UILabel!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var message: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!
    
    weak var delegate: MessageCellInteractionDelegate?

    var cellModel: MessageTableViewCellModel? {
        didSet {
            configure(cellModel)
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        sender.text = ""
        time.text = ""
        title.text = ""
        message.text = ""
        customizeFavoriteButton(isFavorite: false)
    }
    
    private func configure(_ cellModel: MessageTableViewCellModel?) {

        guard let cellModel else { return }

        avatarView.avatarViewModel = AvatarViewModel(title: cellModel.sender,
                                                     imageReference: cellModel.imageReference,
                                                     color: cellModel.avatarColor)
        sender.text = cellModel.sender
        time.text = cellModel.time
        title.text = cellModel.title
        message.text = cellModel.message
        
        customizeFonts(isSeen: cellModel.isSeen)
        customizeFavoriteButton(isFavorite: cellModel.isFavorite)
    }
    
    @IBAction func favoriteButtonAction(_ sender: UIButton) {
        let isFavorite = !(cellModel?.isFavorite ?? false)
        customizeFavoriteButton(isFavorite: isFavorite)
        delegate?.didTapOnFavorite(id: cellModel?.id, isFavorite: isFavorite)
    }
    
    private func customizeFonts(isSeen: Bool) {
        if isSeen {
            sender.font = .systemFont(ofSize: sender.font.pointSize, weight: .regular)
            time.font = .systemFont(ofSize: time.font.pointSize, weight: .regular)
            time.textColor = .darkGray
            title.font = .systemFont(ofSize: time.font.pointSize, weight: .regular)
        } else {
            sender.font = .systemFont(ofSize: sender.font.pointSize, weight: .bold)
            time.font = .systemFont(ofSize: time.font.pointSize, weight: .bold)
            time.textColor = .black
            title.font = .systemFont(ofSize: time.font.pointSize, weight: .bold)
        }
    }
    
    private func customizeFavoriteButton(isFavorite: Bool) {
        if isFavorite {
            favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            favoriteButton.tintColor = .systemBlue
        } else {
            favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
            favoriteButton.tintColor = .lightGray
        }
    }
}
