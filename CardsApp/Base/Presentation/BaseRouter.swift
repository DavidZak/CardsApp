//
//  BaseRouter.swift
//  CardsApp
//
//  Created by David Zakharyan on 28.01.2020.
//  Copyright © 2020 David Zakharyan. All rights reserved.
//

import Foundation
import UIKit

//Base protocol for router layer
protocol RouterProtocol: class {
    func dismissCurrentViewController()
    func popCurrentViewController()
}

class Router : RouterProtocol {
    weak var viewProtocol: ViewProtocol!
    
    init(view: ViewProtocol) {
        self.viewProtocol = view
    }
    
    func dismissCurrentViewController() {
        fatalError("You need implement method in child class")
    }
    
    func popCurrentViewController() {
        fatalError("You need implement method in child class")
    }
}
