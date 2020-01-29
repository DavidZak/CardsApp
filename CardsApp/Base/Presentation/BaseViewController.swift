//
//  BaseViewController.swift
//  CardsApp
//
//  Created by David Zakharyan on 28.01.2020.
//  Copyright © 2020 David Zakharyan. All rights reserved.
//

import Foundation
import UIKit

//Base protocol for view layer
protocol ViewProtocol: class {
    var presenterProtocol: PresenterProtocol! { set get }
}

class BaseViewController: UIViewController, ViewProtocol {
    var presenterProtocol: PresenterProtocol!
    var configuratorProtocol: ConfiguratorProtocol?
}
