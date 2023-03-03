//
//  ToUserTableViewCellTableViewCell.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 03.03.23.
//

import UIKit

protocol ToCellInteractingDelegate: AnyObject {
    func shouldEnableSendButton(_ shouldEnable: Bool)
    func shouldUpdateSellSize()
}

final class ToUserTableViewCellTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var arrowButton: UIButton!
    @IBOutlet private weak var toTextField: UITextField!
    @IBOutlet private weak var toStackView: UIStackView!
    @IBOutlet private weak var bccStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        toTextField.delegate = self
    }

    weak var delegate: ToCellInteractingDelegate?

    private var areFieldsShown: Bool = false {
        didSet {
            toStackView.isHidden = !areFieldsShown
            bccStackView.isHidden = !areFieldsShown
            if areFieldsShown {
                arrowButton.setImage(UIImage(systemName: "arrow.up"), for: .normal)
            } else {
                arrowButton.setImage(UIImage(systemName: "arrow.down"), for: .normal)
            }
            delegate?.shouldUpdateSellSize()
        }
    }

    @IBAction func arrowButtonAction(_ sender: UIButton) {
        areFieldsShown.toggle()
    }
}

extension ToUserTableViewCellTableViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.shouldEnableSendButton(!(textField.text?.isEmpty ?? true))
    }
}
