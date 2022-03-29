//
//  StoreTableViewCell.swift
//  PhotoChat
//
//  Created by Vitaly Khryapin on 25.03.2022.
//

import UIKit

class StoreTableViewCell: UITableViewCell {
   
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let cellCollectionViewID = "storeCollectionCell"
    let modalController = ModelController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
        

    }

}

//MARK: - CollectionView
extension StoreTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modalController.profileArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellCollectionViewID, for: indexPath) as? StoreCollectionViewCell {
            cell.nameLabel.text = modalController.profileArray[indexPath.row].nameProfile
            if let imageProfile = modalController.profileArray[indexPath.row].imageProfile {
                cell.photoImageView.image = UIImage(named: imageProfile)
            }
            cell.photoImageView.layer.cornerRadius = 25
            return cell
        }
        return UICollectionViewCell()
    }
}
