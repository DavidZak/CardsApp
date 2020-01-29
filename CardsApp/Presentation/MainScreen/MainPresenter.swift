//
//  MainPresenter.swift
//  CardsApp
//
//  Created by David Zakharyan on 28.01.2020.
//  Copyright © 2020 David Zakharyan. All rights reserved.
//

import Foundation

protocol MainPresenterProtocol: PresenterProtocol {
    func loadCards(query: String)
    func cardsLoaded(cards: [Card])
    func getData() -> [Card]
}

class MainPresenter: Presenter {
    
    var view: MainViewProtocol {
        return viewProtocol as! MainViewProtocol
    }
    
    var router: MainRouterProtocol {
        return routerProtocol as! MainRouterProtocol
    }
    
    var interactor: MainInteractorProtocol {
        return interactorProtocol as! MainInteractorProtocol
    }
    
    var debouncer: Debouncer = Debouncer(1.0)
    var data: [Card] = [Card]()
    
    override func configureView() {
        view.configureTableView()
        view.configureSearchBar()
    }
}

extension MainPresenter: MainPresenterProtocol {
    func loadCards(query: String) {
        self.view.showLoading(true)
        self.debouncer.executeTask {
            self.interactor.loadCards(query: query) { (cards, error) in
                self.view.showLoading(false)
                if let err = error {
                    self.view.showError(err.errorMessage)
                    self.cardsLoaded(cards: [])
                } else {
                    self.cardsLoaded(cards: cards!.data!)
                }
            }
        }
    }
    
    func cardsLoaded(cards: [Card]) {
        self.data = cards
        self.view.dataLoaded(cards)
    }
    
    func getData() -> [Card] {
        return self.data
    }
}
