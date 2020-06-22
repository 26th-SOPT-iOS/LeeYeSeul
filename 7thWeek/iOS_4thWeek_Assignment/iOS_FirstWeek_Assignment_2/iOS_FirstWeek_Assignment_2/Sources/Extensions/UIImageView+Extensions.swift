//
//  UIImageView+Extensions.swift
//  DdoDdo-iOS
//
//  Created by 이주혁 on 2020/06/06.
//  Copyright © 2020 이주혁. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

// Kingfisher를 이용하여 url로부터 이미지를 가져오는 extension
extension UIImageView {
    public func imageFromUrl(_ urlString: String?, defaultImgPath : String) {
        let defaultImg = UIImage(named: defaultImgPath)
        if let url = urlString {
            if url.isEmpty {
                self.image = defaultImg
            } else {
                self.kf.setImage(with: URL(string: url), placeholder: defaultImg, options: [.transition(ImageTransition.fade(0.5))])
            }
        } else {
            self.image = defaultImg
        }
    }
    func setImage(from url: String, completion: @escaping (UIImage?) -> Void)
    {
        // URL이 들어오는 것을 Cache 키로 사용
        self.kf.indicatorType = .activity
        self.kf.setImage(with: URL(string: url)!, placeholder: UIImage(), options: [.transition(.fade(1))], progressBlock: nil) { result in
            switch result {
            case .success(let value): completion(value.image)
            case .failure(let err):
                print(err.errorCode)
                completion(nil)
            }
            
        }
    }

}

//extension UIImageView {
//    func setImage(from url: String) {
//        self.kf.indicatorType = .activity
//        let cache = ImageCache.default
//        cache.retrieveImage(forKey: url) { result in
//            switch result {
//            case .success(let value):
//                if value.image != nil { self.image = value.image } else { self.kf.setImage(with: URL(string: url)) }
//            case .failure(let err):
//                print(err.errorCode)
//            }
//        }
//    }
//}
