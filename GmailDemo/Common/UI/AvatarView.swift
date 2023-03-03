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
    var color: UIColor
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
    
    lazy private var avatarContainerView = createContainerView()
    lazy private var defaultAvatarLabel = createLabel()
    lazy private var avatarImageView = createImageView()
    
    private func configure(_ avatarViewModel: AvatarViewModel?) {

        guard let avatarViewModel else { return }

        subviews.forEach { $0.removeFromSuperview() }
        ImageLoader.stopPreviousLoad(for: avatarImageView)

        setupAvatar()
        configureDefaultAvatarLabel(with: avatarViewModel)
        defaultAvatarLabel.isHidden = false
        avatarImageView.isHidden = true
        if let url = avatarViewModel.imageReference {
            ImageLoader.loadImage(from: url, into: avatarImageView) { [weak self] image, error in
                guard
                    let self,
                    error == nil
                else { return }

                self.avatarImageView.image = image
                self.defaultAvatarLabel.isHidden = true
                self.avatarImageView.isHidden = false
            }
        }
    }
    
    private func configureDefaultAvatarLabel(with avatarViewModel: AvatarViewModel) {
        defaultAvatarLabel.text = avatarViewModel.title.getFirstLetter()
        defaultAvatarLabel.font = .systemFont(ofSize: 20)
        defaultAvatarLabel.backgroundColor = avatarViewModel.color
        defaultAvatarLabel.textColor = avatarViewModel.color.whiter()
    }
    
    private func setupAvatar() {
        updateCornerRadius()
        addSubviewWithConstraints(avatarContainerView)
        avatarContainerView.addSubviewWithConstraints(avatarImageView)
        avatarContainerView.addSubviewWithConstraints(defaultAvatarLabel)
    }

    private func createContainerView() -> UIView {

        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.isUserInteractionEnabled = false
        containerView.clipsToBounds = true

        return containerView
    }
    
    private func createImageView() -> UIImageView {

        let avatarImageView = UIImageView(frame: bounds)
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true
        avatarImageView.isUserInteractionEnabled = false

        return avatarImageView
    }

    private func createLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: frame.height / 2)
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
