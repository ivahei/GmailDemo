//
//  HomeViewController.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 02.03.23.
//

import Combine
import UIKit

final class HomeViewController: ViewController<HomeViewModel, HomeCoordinator>,
                                SnackBarViewShowable {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var avatarView: AvatarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupUI()
        tableView.register(MessageTableViewCell.self)
    }
    
    override func setupBindings() {
        viewModel.$mails
            .receive(on: DispatchQueue.main)
            .sink { [weak self] emails in
                guard let tableView = self?.tableView else { return }
    
                UIView.transition(with: tableView,
                                  duration: 0.2,
                                  options: .transitionCrossDissolve) {
                    tableView.reloadData()
                }
            }
            .store(in: &subscriptions)
    }
    
    private func setupUI() {
        setupShadows()
        setupAvatarView()
        showSnackBar(with: "Signed in as va.abazyan@gmail.com")
    }
    
    private func setupAvatarView() {
        avatarView.avatarViewModel = AvatarViewModel(title: "Vahe Abazyan",
                                                     imageReference: "https://media.licdn.com/dms/image/C5603AQERhYE9mUFXIA/profile-displayphoto-shrink_800_800/0/1613651362650?e=2147483647&v=beta&t=j3oVR0PoFscQZTyKkS2nZXhesYE47maEoiGeLit9f7M",
                                                     color: UIColor.getRandomColor())
    }
    
    private func setupShadows() {
        composeButton.addShadow()
        headerView.addShadow(shadowOpacity: 0.1,
                             cornerRadius: 8,
                             shadowColor: .black,
                             shadowRadius: 4)
    }
    
    @IBAction func composeButtonAction(_ sender: UIButton) {
        coordinator.coordinateToComposeEmail()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.mails?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 30)
        let returnedView = UIView(frame: frame)
        returnedView.backgroundColor = .white
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.tintColor = .gray
        label.text = "ALL INBOXES"
        returnedView.addSubviewWithConstraints(label, inset: .init(top: 0,
                                                                   left: 16,
                                                                   bottom: 0,
                                                                   right: 0))
        
        return returnedView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withCellType: MessageTableViewCell.self,
                                                 forIndexPath: indexPath)
        cell.cellModel = viewModel.mails?[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.backgroundColor = .secondarySystemBackground
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.contentView.backgroundColor = .white
        }
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [.init(style: .destructive,
                                                           title: "Delete",
                                                           handler: { [unowned self, unowned tableView] _, _, close in
            self.removeFromTableView(tableView, indexPath: indexPath, close: close)
        })])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [.init(style: .destructive,
                                                           title: "Delete",
                                                           handler: { [unowned self, unowned tableView] _, _, close in
            self.removeFromTableView(tableView, indexPath: indexPath, close: close)
        })])
    }
    
    private func removeFromTableView(_ tableView: UITableView, indexPath: IndexPath, close: @escaping (Bool) -> Void) {
        viewModel.removeItem(at: indexPath.row)
        close(false)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectItem(at: indexPath.row)
    }
}

extension HomeViewController: MessageCellInteractionDelegate {
    func didTapOnFavorite(id: UUID?, isFavorite: Bool) {
        viewModel.updateFavorite(with: id, isFavorite: isFavorite)
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension HomeViewController {
    static func makeViewController() -> HomeViewController {
        
        let viewController = HomeViewController()
        viewController.viewModel = HomeViewModel(service: HomeServiceInput())
        
        return viewController
    }
}
