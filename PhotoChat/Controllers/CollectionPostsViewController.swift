//
//  CollectionPostsViewController.swift
//  PhotoChat
//
//  Created by Vitaly Khryapin on 27.03.2022.
//

import UIKit

class CollectionPostsViewController: UIViewController {
    @IBOutlet weak var postsCollectionView: UICollectionView! {
        didSet {
            postsCollectionView.delegate = self
            postsCollectionView.dataSource = self
        }
    }
    
    let postCellID = "postsCell"
    var modelController: ModelController!
    let itemsPerRow: CGFloat = 2
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "onePostVC" {
            let photoVC = segue.destination as! OnePostViewController
            let cell = sender as! PostsCollectionViewCell
            photoVC.image = cell.postImage.image
        }
    }
}

extension CollectionPostsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelController.postArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: postCellID, for: indexPath) as? PostsCollectionViewCell else { return UICollectionViewCell() }
            if let imagePost = modelController.postArray[indexPath.row].imagePost,
               let name = modelController.postArray[indexPath.row].name {
                cell.postImage.image = UIImage(named: imagePost)
                cell.nameLabel.text = name
                return cell
            }
        return UICollectionViewCell()
    }
}


//MARK: - Layout
extension CollectionPostsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingWith = sectionInserts.left * (itemsPerRow + 1)
        let availabelWidth  = collectionView.frame.width - paddingWith
        let widthPerItem = availabelWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
}
