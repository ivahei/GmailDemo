//
//  ComposeEmailTableViewCell.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 03.03.23.
//

import UIKit

protocol ComposeEmailCellSizeChangingDelegate: AnyObject {
    func didChangeTextViewText()
}

final class ComposeEmailTableViewCell: UITableViewCell {
    
    weak var delegate: ComposeEmailCellSizeChangingDelegate?

    @IBOutlet weak var textView: UITextView! {
        didSet {
            showPlaceHolder(true)
            textView.delegate = self
        }
    }

    private func showPlaceHolder(_ shouldShow: Bool) {
        if shouldShow {
            textView.text = "Compose Email"
            textView.textColor = .darkGray
        } else if textView.textColor == .darkGray || textView.text.isEmpty {
            textView.text = ""
            textView.textColor = .black
        }
    }
}

extension ComposeEmailTableViewCell: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        DispatchQueue.main.async {
            textView.reloadInputViews()
        }
        showPlaceHolder(false)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        delegate?.didChangeTextViewText()
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        showPlaceHolder(textView.text.isEmpty)
    }
}
