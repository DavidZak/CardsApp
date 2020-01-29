//
//  MainViewController.swift
//  CardsApp
//
//  Created by David Zakharyan on 28.01.2020.
//  Copyright © 2020 David Zakharyan. All rights reserved.
//

import Foundation
import UIKit
import Combine

protocol MainViewProtocol: ViewProtocol {
    func showLoading(_ show: Bool)
    func showError(_ errorMessage: String)
    func dataLoaded(_ cards: [Card])
    func configureTableView()
    func configureSearchBar()
}

class MainViewController: BaseViewController {
    
    @IBOutlet weak var tableViewCards: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var cards: [Card] = [Card]()
    
    var configurator: MainConfiguratorProtocol {
        return MainConfigurator()
    }
    
    var presenter: MainPresenterProtocol {
        return presenterProtocol as! MainPresenterProtocol
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.configureView()
    }
}

extension MainViewController: MainViewProtocol {
    func showLoading(_ show: Bool) {
        if show {
            self.showPreloaderView()
        } else {
            self.hidePreloaderView()
        }
    }
    
    func showError(_ errorMessage: String) {
        self.showSimpleAlert(message: errorMessage)
    }
    
    func dataLoaded(_ cards: [Card]) {
        tableViewCards.reloadData()
    }
    
    func configureTableView() {
        tableViewCards.dataSource = self
        tableViewCards.delegate = self
        tableViewCards.rowHeight = UITableView.automaticDimension
        tableViewCards.estimatedRowHeight = 100
    }
    
    func configureSearchBar() {
        // Setup the Search Controller
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "search_placeholder".localized
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        
        // Setup the Scope Bar
        searchController.searchBar.delegate = self
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.getData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardTableCell") as! CardTableCell
        cell.bind(card: self.presenter.getData()[indexPath.row])
        return cell
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.presenter.loadCards(query: searchText)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.presenter.loadCards(query: "")
    }
}
