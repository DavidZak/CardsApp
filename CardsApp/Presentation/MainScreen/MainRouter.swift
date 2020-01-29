//
//  MainRouter.swift
//  CardsApp
//
//  Created by David Zakharyan on 28.01.2020.
//  Copyright © 2020 David Zakharyan. All rights reserved.
//

import Foundation
import UIKit

protocol MainRouterProtocol: RouterProtocol {
    
}

class MainRouter : Router {
    
    weak var view: MainViewController? {
        return viewProtocol as? MainViewController
    }
    
    override func dismissCurrentViewController() {
        view?.dismiss(animated: true, completion: nil)
    }
    
    override func popCurrentViewController() {
        view?.navigationController?.popViewController(animated: true)
    }
}

extension MainRouter: MainRouterProtocol {
    
}
