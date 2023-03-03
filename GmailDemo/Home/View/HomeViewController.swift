//
//  HomeViewController.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 02.03.23.
//

import Combine
import UIKit

final class HomeViewController: ViewController<HomeViewModel, HomeCoordinator> {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var composeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        tableView.register(MessageTableViewCell.self)

        viewModel.$mails.sink { emails in
        }.store(in: &subscriptions)
    }
    
    private func setupUI() {
        composeButton.addShadow()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
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
        cell.cellModel = MessageTableViewCellModel(sender: "Google",
                                                   time: "10:20",
                                                   title: "Message",
                                                   message: "sakmldlasmdlamdlasmdal",
                                                   isFavorite: false)
        return cell
    }
}

extension HomeViewController {
    static func makeViewController() -> HomeViewController {
        
        let viewController = HomeViewController()
        viewController.viewModel = HomeViewModel()
        
        return viewController
    }
}
