//
//  Cards.swift
//  CardsApp
//
//  Created by David Zakharyan on 28.01.2020.
//  Copyright © 2020 David Zakharyan. All rights reserved.
//

import Foundation

struct Cards: Codable {
    let object: String?
    let details: String?
    let data: [Card]?
}
