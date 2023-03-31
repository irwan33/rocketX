//
//  RocketTableViewCell.swift
//  spaceX
//
//  Created by Ewide Dev. 2 on 27/02/23.
//

import UIKit
import Kingfisher
class RocketTableViewCell: UITableViewCell {
    @IBOutlet weak var imageRocket: UIImageView!
    @IBOutlet weak var nameRockets: UILabel!
    @IBOutlet weak var countryRockets: UILabel!
    
    var itemData: RocketModel! {
         didSet {
             setProductData()
         }
     }
    
    private func setProductData() {
        nameRockets.text = itemData.name
        countryRockets.text = itemData.country
        guard let imgRocket = itemData.flickrImages.first else { return }
        imageRocket.kf.setImage(with: URL(string: imgRocket))
    }
}
