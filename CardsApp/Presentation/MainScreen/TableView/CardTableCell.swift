//
//  CardTableCell.swift
//  CardsApp
//
//  Created by David Zakharyan on 28.01.2020.
//  Copyright © 2020 David Zakharyan. All rights reserved.
//

import UIKit
import Kingfisher

class CardTableCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var illustratorLabel: UILabel!
    @IBOutlet weak var cardImage: KFImageView!
    
    func bind(card: Card) {
        nameLabel.text = card.name
        descriptionLabel.text = card.oracleText
        illustratorLabel.text = String(format: "artist".localized, card.artist ?? "")
        cardImage.setImage(url: card.imageUris?.small)
    }
}
