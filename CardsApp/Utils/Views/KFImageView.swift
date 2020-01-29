//
//  KFImageView.swift
//  CardsApp
//
//  Created by David Zakharyan on 28.01.2020.
//  Copyright © 2020 David Zakharyan. All rights reserved.
//

import Foundation
import Kingfisher

//Custom image view with Kingfisher image loading
class KFImageView : UIImageView {
    var url: String?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        defaultImage = image
    }
    
    func setImage(url: String?) {
        kf.cancelDownloadTask()
        
        guard let `url` = url else {
            image = defaultImage
            return
        }
        
       if let path = URL(string: url) {
            kf.setImage(with: path, placeholder: defaultImage) { [weak self] img, error, cacheType, url in
                if img == nil {
                    self?.image = self?.defaultImage
                }
            }
        } else {
            image = defaultImage
        }
    }
    
    private var defaultImage: UIImage?
}
