//
//  UIView+Extension.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 02.03.23.
//

import UIKit

public extension UIView {

    func addSubviewWithConstraints(_ subView: UIView, inset: CustomEdgeInsets = CustomEdgeInsets()) {

        self.addSubview(subView)
        subView.translatesAutoresizingMaskIntoConstraints = false

        if let top = inset.top {
            if inset.includesTopSafeArea {
                self.addConstraints([
                    NSLayoutConstraint(item: subView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .topMargin, multiplier: 1.0, constant: top)
                ])
            } else {
                self.addConstraints([
                    NSLayoutConstraint(item: subView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: top)
                ])
            }
        }

        if let left = inset.left {
            if inset.includesLeftSafeArea {
                self.addConstraints([
                    NSLayoutConstraint(item: subView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leadingMargin, multiplier: 1.0, constant: left)
                ])
            } else {
                self.addConstraints([
                    NSLayoutConstraint(item: subView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: left)
                ])
            }
        }

        if let bottom = inset.bottom {
            if inset.includesBottomSafeArea {
                self.addConstraints([
                    NSLayoutConstraint(item: subView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottomMargin, multiplier: 1.0, constant: -bottom)
                ])
            } else {
                self.addConstraints([
                    NSLayoutConstraint(item: subView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -bottom)
                ])
            }
        }

        if let right = inset.right {
            if inset.includesRightSafeArea {
                self.addConstraints([
                    NSLayoutConstraint(item: subView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailingMargin, multiplier: 1.0, constant: -right)
                ])
            } else {
                self.addConstraints([
                    NSLayoutConstraint(item: subView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -right)
                ])
            }

        }
    }
}

public struct CustomEdgeInsets {

    public var top: CGFloat?

    public var left: CGFloat?

    public var bottom: CGFloat?

    public var right: CGFloat?

    public var includesTopSafeArea: Bool

    public var includesBottomSafeArea: Bool

    public var includesLeftSafeArea: Bool

    public var includesRightSafeArea: Bool

    public init(includesTopSafeArea: Bool = false,
                includesBottomSafeArea: Bool = false,
                includesLeftSafeArea: Bool = false,
                includesRightSafeArea: Bool = false) {
        self.top = 0
        self.left = 0
        self.bottom = 0
        self.right = 0

        self.includesTopSafeArea = includesTopSafeArea
        self.includesBottomSafeArea = includesBottomSafeArea
        self.includesLeftSafeArea = includesLeftSafeArea
        self.includesRightSafeArea = includesRightSafeArea
    }

    public init(top: CGFloat?,
                left: CGFloat?,
                bottom: CGFloat?,
                right: CGFloat?,
                includesTopSafeArea: Bool = false,
                includesBottomSafeArea: Bool = false,
                includesLeftSafeArea: Bool = false,
                includesRightSafeArea: Bool = false) {
        self.top = top
        self.left = left
        self.bottom = bottom
        self.right = right

        self.includesTopSafeArea = includesTopSafeArea
        self.includesBottomSafeArea = includesBottomSafeArea
        self.includesLeftSafeArea = includesLeftSafeArea
        self.includesRightSafeArea = includesRightSafeArea
    }
}

extension UIView {
    func addShadow(shadowOpacity: Float = 0.2,
                   cornerRadius: CGFloat = 18,
                   shadowColor: UIColor = .black,
                   shadowRadius: CGFloat = 16) {
        
        layer.shadowColor = shadowColor.cgColor
        layer.cornerRadius = cornerRadius
        layer.shadowOpacity = shadowOpacity
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowRadius = shadowRadius
    }
}
