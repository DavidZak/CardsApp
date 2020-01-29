//
//  CardsService.swift
//  CardsApp
//
//  Created by David Zakharyan on 28.01.2020.
//  Copyright © 2020 David Zakharyan. All rights reserved.
//

import Foundation

//Service for cards data
class CardsService: Service {
    /// Load cards data
    /// - Parameters:
    ///   - requestBody: GetCardsBody
    ///   - completionHandler: completion handler
    static func loadCards(requestBody: GetCardsBody, completionHandler: @escaping (_ result: Cards?, _ error: AppError?) -> Void) {
        callServerApiWithResponse(resultType: Cards.self, requestBody: requestBody, completion: { (resp, err) in
            completionHandler(resp as? Cards, err)
        })
    }
}
