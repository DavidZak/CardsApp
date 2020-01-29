//
//  BaseInteractor.swift
//  CardsApp
//
//  Created by David Zakharyan on 28.01.2020.
//  Copyright © 2020 David Zakharyan. All rights reserved.
//

import Foundation

//Base protocol for interactor layer
protocol InteractorProtocol: class {
    
}

class Interactor: InteractorProtocol {
    
    weak var presenterProtocol: PresenterProtocol!
    
    required init(presenter: PresenterProtocol) {
        self.presenterProtocol = presenter
    }
}

