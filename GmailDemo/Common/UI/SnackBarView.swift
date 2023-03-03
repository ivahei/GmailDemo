//
//  SnackBarView.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 03.03.23.
//

import UIKit

protocol SnackBarViewShowable where Self: UIViewController {
    func showSnackBar(with message: String)
}

extension SnackBarViewShowable {
    func showSnackBar(with message: String) {
        let snackBarView = SnackBarView.snackBar(with: message)
        var bottomInset = view.safeAreaInsets.bottom + 20
        if let tabBar = tabBarController?.tabBar,
           !tabBar.isHidden {
            bottomInset = tabBar.frame.size.height
        }
        let y = view.frame.maxY - bottomInset - snackBarView.frame.size.height
        let initialY  = self.view.frame.maxY
        snackBarView.frame.origin = CGPoint(x: 0, y: initialY)
        self.view.addSubview(snackBarView)
        
        UIView.animate(withDuration: 0.25) {
            snackBarView.frame.origin = CGPoint(x: 0, y: y)
        } completion: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                UIView.animate(withDuration: 0.25) {
                    snackBarView.frame.origin = CGPoint(x: 0, y: initialY)
                } completion: { _ in
                    snackBarView.removeFromSuperview()
                }
            }
        }
    }
}

final class SnackBarView: UIView {
    
    lazy private var label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    public var message = "" {
        didSet {
            label.text = message
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .clear
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 4
        
        addSubviewWithConstraints(view, inset: CustomEdgeInsets(top: 0,
                                                                left: 8,
                                                                bottom: 16,
                                                                right: 8))

        view.addSubviewWithConstraints(label, inset: CustomEdgeInsets(top: 0,
                                                                      left: 16,
                                                                      bottom: 0,
                                                                      right: 16))
    }
    
    static public func snackBar(with message: String) -> SnackBarView {
        let view = SnackBarView(frame: CGRect(origin: .zero,
                                              size: CGSize(width: UIScreen.main.bounds.width,
                                                           height: 64)))
        
        view.message = message
        return view
    }
}
