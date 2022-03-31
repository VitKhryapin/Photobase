//
//  StoreCollectionViewCell.swift
//  PhotoChat
//
//  Created by Vitaly Khryapin on 25.03.2022.
//

import UIKit

class StoreCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func setupCell(profile: ModelProfile) {
        if let photo = profile.imageProfile {
            self.photoImageView.image = UIImage(named: photo)
        }
        self.nameLabel.text = profile.nameProfile
    }
}

