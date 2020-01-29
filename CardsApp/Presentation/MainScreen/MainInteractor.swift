//
//  MainInteractor.swift
//  CardsApp
//
//  Created by David Zakharyan on 28.01.2020.
//  Copyright © 2020 David Zakharyan. All rights reserved.
//

import Foundation

protocol MainInteractorProtocol: InteractorProtocol {
    func loadCards(query: String, completion: @escaping (_ result: Cards?, _ error: AppError?) -> Void)
}

class MainInteractor: Interactor {
    var presenter: MainPresenterProtocol {
        return presenterProtocol as! MainPresenterProtocol
    }
}

extension MainInteractor: MainInteractorProtocol {
    func loadCards(query: String, completion: @escaping (_ result: Cards?, _ error: AppError?) -> Void) {
        CardsService.loadCards(requestBody: GetCardsBody(query: query)) { (response, error) in
            completion(response, error)
        }
    }
}
