//
//  BasePresenter.swift
//  CardsApp
//
//  Created by David Zakharyan on 28.01.2020.
//  Copyright © 2020 David Zakharyan. All rights reserved.
//

import Foundation

//Base protocol for presenter layer
protocol PresenterProtocol: class {
    var interactorProtocol: InteractorProtocol! { set get }
    var routerProtocol: RouterProtocol! { set get }
    func configureView()
    func dismissButtonClicked()
    func popButtonClicked()
}

class Presenter: PresenterProtocol {
    
    weak var viewProtocol: ViewProtocol!
    var interactorProtocol: InteractorProtocol!
    var routerProtocol: RouterProtocol!
    
    required init(view: ViewProtocol) {
        self.viewProtocol = view
    }
    
    //MARK: - PresenterProtocol methods
    func configureView() {
        
    }
    
    func dismissButtonClicked() {
        routerProtocol.dismissCurrentViewController()
    }
    
    func popButtonClicked() {
        routerProtocol.popCurrentViewController()
    }
}
