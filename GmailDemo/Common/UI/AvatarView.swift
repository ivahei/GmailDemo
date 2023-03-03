//
//  AvatarView.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 02.03.23.
//

import UIKit

struct AvatarViewModel {
    let title: String
    var imageReference: String? = nil
}

final class AvatarView: UIView {

    var avatarViewModel: AvatarViewModel? {
        didSet {
            configure(avatarViewModel)
        }
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateCornerRadius()
    }

    func setupUI() {
        backgroundColor = .clear
    }
    
    lazy var avatarContainerView = createContainerView()
    lazy var defaultAvatarLabel = createLabel()
    
    private func configure(_ avatarViewModel: AvatarViewModel?) {

        guard let avatarViewModel else { return }

        subviews.forEach { $0.removeFromSuperview() }
        updateCornerRadius()
        addSubviewWithConstraints(avatarContainerView)
        avatarContainerView.addSubviewWithConstraints(defaultAvatarLabel)
        defaultAvatarLabel.text = avatarViewModel.title.getFirstLetter()
        defaultAvatarLabel.font = .systemFont(ofSize: 20)
    }

    private func createContainerView() -> UIView {

        let containerView = UIView()
        containerView.backgroundColor = UIColor.white
        containerView.isUserInteractionEnabled = false
        containerView.clipsToBounds = true

        return containerView
    }

    private func createLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: frame.height / 2)
        label.backgroundColor = UIColor.getRandomColor()
        label.textColor = label.backgroundColor?.whiter()
        label.text = ""
        label.center = center
        label.textAlignment = .center

        return label
    }
    
    private func updateCornerRadius() {
        layer.cornerRadius = frame.size.width / 2
        avatarContainerView.layer.cornerRadius = avatarContainerView.frame.size.width / 2
        defaultAvatarLabel.layer.cornerRadius = defaultAvatarLabel.frame.size.width / 2
    }
}
