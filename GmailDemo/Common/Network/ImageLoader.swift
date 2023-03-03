//
//  ImageLoader.swift
//  GmailDemo
//
//  Created by Vahe Abazyan on 03.03.23.
//

import UIKit
import SDWebImage

public class ImageLoader {
    
    public static func stopPreviousLoad(for imageView: UIImageView) {
        imageView.sd_cancelCurrentImageLoad()
    }
    
    public static func loadImage(
        from url: String?,
        into imageView: UIImageView,
        completion: ((UIImage?, Error?) -> Void)? = nil
    ) {
        let imageUrl = URL(string: url ?? "")
        imageView.sd_setImage(
            with: imageUrl,
            placeholderImage: nil,
            options: .highPriority
        ) { image, error, _, _ in
            completion?(image, error)
        }
    }
}
