//
//  PreloaderView.swift
//  CardsApp
//
//  Created by David Zakharyan on 28.01.2020.
//  Copyright © 2020 David Zakharyan. All rights reserved.
//

import UIKit

//View for controller loading indication
class PreloaderView: UIView {
    static let shared: PreloaderView = PreloaderView()
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        
        backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.3)
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        activityIndicator.center = center
        activityIndicator.startAnimating()
        addSubview(activityIndicator)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
