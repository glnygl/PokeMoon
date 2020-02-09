//
//  PokeListCollectionCell.swift
//  PokeMoon
//
//  Created by Gülenay Gül on 23.01.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import UIKit
import Alamofire

class Cache {
    static let shared = NSCache< NSString, UIImage>()
}

class PokeListCollectionCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
     
    var dataRequest: DataRequest?
   // var cache = NSCache< NSString, UIImage>()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 20
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.iconImage.image = nil
        dataRequest?.cancel()
    }
    
    func configure(pokemon: Pokemon) {
        
        nameLabel.text = pokemon.name
        if let imageUrl = pokemon.img {
            
            dataRequest = Service.imageRequest(url: imageUrl).responseImage { [weak self] image in
                DispatchQueue.main.async {
                    if let image = image.value {
                        self?.iconImage.image = image
                        Cache.shared.setObject(image, forKey: imageUrl as NSString)                        
                    }
                }
            }
        }
    }
    
    

}
