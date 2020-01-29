//
//  MainConfigurator.swift
//  CardsApp
//
//  Created by David Zakharyan on 28.01.2020.
//  Copyright © 2020 David Zakharyan. All rights reserved.
//

import Foundation

protocol MainConfiguratorProtocol: ConfiguratorProtocol {
    
}

class MainConfigurator : Configurator, MainConfiguratorProtocol {
    
    override func configure(with viewController: BaseViewController) {
        let presenter = MainPresenter(view: viewController)
        let interactor = MainInteractor(presenter: presenter)
        let router = MainRouter(view: viewController)
        
        viewController.presenterProtocol = presenter
        presenter.interactorProtocol = interactor
        presenter.routerProtocol = router
        
    }
    
}
