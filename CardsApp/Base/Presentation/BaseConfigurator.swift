//
//  BaseConfigurator.swift
//  CardsApp
//
//  Created by David Zakharyan on 28.01.2020.
//  Copyright © 2020 David Zakharyan. All rights reserved.
//

import Foundation

//Base protocol for configurator
protocol ConfiguratorProtocol: class {
    func configure(with viewController: BaseViewController)
}

class Configurator: ConfiguratorProtocol {
    /// Configures view controller with other layers
    /// - Parameter viewController: UIViewController
    func configure(with viewController: BaseViewController) {
        fatalError("You need to implement base configurator configure method for all view controllers")
    }
}
