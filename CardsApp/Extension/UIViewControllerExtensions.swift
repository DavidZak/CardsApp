//
//  UIViewControllerExtensions.swift
//  CardsApp
//
//  Created by David Zakharyan on 28.01.2020.
//  Copyright © 2020 David Zakharyan. All rights reserved.
//

import UIKit

//Extensions for UIViewControllers
extension UIViewController {
    func showSimpleAlert(title: String? = "", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok".localized, style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showPreloaderView() {
        self.view.addSubview(PreloaderView.shared)
    }
    
    func hidePreloaderView() {
        PreloaderView.shared.removeFromSuperview()
    }
}
