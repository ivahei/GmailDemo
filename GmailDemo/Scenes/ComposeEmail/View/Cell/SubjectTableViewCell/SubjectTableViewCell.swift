//
//  SubjectTableViewCell.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 03.03.23.
//

import UIKit

final class SubjectTableViewCell: UITableViewCell {

    @IBOutlet private weak var subjectTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        subjectTextField.delegate = self
    }
}

extension SubjectTableViewCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
