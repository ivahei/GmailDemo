//
//  ComposeEmailViewController.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 03.03.23.
//

import UIKit

private enum CellTypes: Int, CaseIterable {
    case toUser
    case fromUser
    case subject
    case compose
}

final class ComposeEmailViewController: ViewController<ComposeEmailViewModel, ComposeEmailCoordinator> {

    @IBOutlet private weak var tableView: UITableView!
    
    lazy var sendButton = UIBarButtonItem(
        image: UIImage(systemName: "paperplane"),
        style: .plain,
        target: self,
        action: #selector(sendButtonTapped))

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupTableView() {
        tableView.register(ToUserTableViewCellTableViewCell.self)
        tableView.register(FromUserTableViewCell.self)
        tableView.register(SubjectTableViewCell.self)
        tableView.register(ComposeEmailTableViewCell.self)
    }

    private func setupUI() {
        setupCloseButtonItem()
        setupNavigationBarRightButtonItems()
    }
    
    private func setupNavigationBarRightButtonItems() {
        let paperclipButton = UIBarButtonItem(
            image: UIImage(systemName: "paperclip"),
            style: .plain,
            target: self,
            action: nil)
        
        let threeDotButton = UIBarButtonItem(
            image: UIImage(systemName: "ellipsis"),
            style: .plain,
            target: self,
            action: nil)

        paperclipButton.tintColor = .darkGray
        threeDotButton.tintColor = .darkGray
        sendButton.tintColor = .darkGray
        sendButton.isEnabled = false

        navigationItem.rightBarButtonItems = [threeDotButton, sendButton, paperclipButton]
    }
    
    @objc func sendButtonTapped() {
        coordinator.back()
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        guard
            let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        else { return }
        
        tableView.contentInset.bottom = keyboardFrame.height
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        tableView.contentInset = .zero
        tableView.scrollIndicatorInsets = .zero
    }
}

extension ComposeEmailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CellTypes.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch CellTypes(rawValue: indexPath.row) {
        case .toUser:
            let cell = tableView.dequeueReusableCell(
                withCellType: ToUserTableViewCellTableViewCell.self,
                forIndexPath: indexPath)
            cell.delegate = self
            return cell
        case .fromUser:
            let cell = tableView.dequeueReusableCell(
                withCellType: FromUserTableViewCell.self,
                forIndexPath: indexPath)
            return cell
        case .subject:
            let cell = tableView.dequeueReusableCell(
                withCellType: SubjectTableViewCell.self,
                forIndexPath: indexPath)
            return cell
        case .compose:
            let cell = tableView.dequeueReusableCell(
                withCellType: ComposeEmailTableViewCell.self,
                forIndexPath: indexPath)
            cell.delegate = self
            return cell
        default:
            fatalError()
        }
    }
}

extension ComposeEmailViewController: ToCellInteractingDelegate,
                                      ComposeEmailCellSizeChangingDelegate {
    func didChangeTextViewText() {
        UIView.setAnimationsEnabled(false)
        tableView.scrollToRow(at: IndexPath(row: CellTypes.compose.rawValue, section: 0),
                              at: .bottom,
                              animated: false)
        tableView.beginUpdates()
        tableView.endUpdates()
        UIView.setAnimationsEnabled(true)
    }

    func shouldEnableSendButton(_ shouldEnable: Bool) {
        sendButton.isEnabled = shouldEnable
        sendButton.tintColor = shouldEnable ? .blue : .darkGray
    }
    
    func shouldUpdateSellSize() {
        tableView.reloadData()
    }
}

extension ComposeEmailViewController {
    static func makeViewController() -> ComposeEmailViewController {
        
        let viewController = ComposeEmailViewController()
        viewController.viewModel = ComposeEmailViewModel(service: ComposeEmailServiceInput())
        
        return viewController
    }
}
