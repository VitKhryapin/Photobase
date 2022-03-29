//
//  LikeCollectionViewController.swift
//  PhotoChat
//
//  Created by Vitaly Khryapin on 29.03.2022.
//

import UIKit

class LikeCollectionViewController: UICollectionViewController {

    var photos = [UnsplashPhoto]()
    private var selectedImages = [UIImage]()
    
    private lazy var trashBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(trashBarButtonTapped))
    }()
    
    private let enterSearchTermLabel: UILabel = {
        let label = UILabel()
        label.text = "You haven't add a photos yet"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var numberOfSelectedPhotos: Int {
        return collectionView.indexPathsForSelectedItems?.count ?? 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(LikesCollectionViewCell.self, forCellWithReuseIdentifier: LikesCollectionViewCell.reuseId)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.allowsMultipleSelection = true
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        
        setupEnterLabel()
        setupNavigationBar()
        updateNavButtonState()
    }
    
    private func updateNavButtonState() {
        trashBarButtonItem.isEnabled = numberOfSelectedPhotos > 0
    }
    
    func refresh() {
        self.selectedImages.removeAll()
        self.collectionView.selectItem(at: nil, animated: true, scrollPosition: [])
        updateNavButtonState()
    }
    
    // MARK: - NavigationItems action
    @objc private func trashBarButtonTapped() {
        print(#function)
//        let selectedPhotos = collectionView.indexPathsForSelectedItems?.reduce([], { (photosss, indexPath) -> [UnsplashPhoto] in
//            var mutablePhotos = photosss
//            let photo = photos[indexPath.item]
//            mutablePhotos.append(photo)
//            return mutablePhotos
//        })
//
//        let alertController = UIAlertController(title: "", message: "\(selectedPhotos!.count) фото будут добавлены в альбом", preferredStyle: .alert)
//        let add = UIAlertAction(title: "Добавить", style: .default) { (action) in
//            let tabbar = self.tabBarController!
//            let navVC = tabbar.viewControllers?[3] as! UINavigationController
//            let likesVC = navVC.topViewController as! LikeCollectionViewController
//            likesVC.photos.append(contentsOf: selectedPhotos ?? [])
//            likesVC.collectionView.reloadData()
//
//            //self.refresh()
//        }
//        let cancel = UIAlertAction(title: "Отменить", style: .cancel) { (action) in
//        }
//        alertController.addAction(add)
//        alertController.addAction(cancel)
//        present(alertController, animated: true)
    }
    
    
    
    // MARK: - Setup UI Elements
    
    private func setupEnterLabel() {
        collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor).isActive = true
        enterSearchTermLabel.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 50).isActive = true
    }
    
    private func setupNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = "FAVOURITES"
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        titleLabel.textColor = #colorLiteral(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
        navigationItem.rightBarButtonItem = trashBarButtonItem
        trashBarButtonItem.isEnabled = false
    }


    // MARK: UICollectionViewDataSource, Delegate


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchTermLabel.isHidden = photos.count != 0
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LikesCollectionViewCell.reuseId, for: indexPath) as! LikesCollectionViewCell
        let unsplashPhoto = photos[indexPath.item]
        cell.unsplashPhoto = unsplashPhoto
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        updateNavButtonState()
        let cell = collectionView.cellForItem(at: indexPath) as! LikesCollectionViewCell
        guard let image = cell.myImageView.image else { return }
        selectedImages.append(image)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        updateNavButtonState()
        let cell = collectionView.cellForItem(at: indexPath) as! LikesCollectionViewCell
        guard let image = cell.myImageView.image else { return }
        if let index = selectedImages.firstIndex(of: image) {
            selectedImages.remove(at: index)
        }
    }

}

// MARK: - UICollectionViewDelegateFlowLayout
extension LikeCollectionViewController: UICollectionViewDelegateFlowLayout {

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.frame.width
    return CGSize(width: width/3 - 1, height: width/3 - 1)
}
}