//
//  ViewController.swift
//  PhotoChat
//
//  Created by Vitaly Khryapin on 25.03.2022.
//

import UIKit

class ViewController: UIViewController, UITabBarDelegate {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    
    let storyCellID = "profCell"
    let postCellID = "postCell"
    let modelController = ModelController()
    var refresh = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refresh.addTarget(self, action: #selector(hendelRefresh), for: .valueChanged)
        self.refresh.tintColor = .white
        tableView.addSubview(refresh)
    }
    
    @objc func hendelRefresh() {
        modelController.postArray.shuffle()
        tableView.reloadData()
        refresh.endRefreshing()
    }
    
}

//MARK: - Table Delegate, DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelController.postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: postCellID, for: indexPath) as? PostNameTableViewCell {
            let post = modelController.postArray[indexPath.row]
            cell.refresh(post)
            cell.photoProfile.layer.cornerRadius = 25
            tableView.rowHeight = cell.postImage.image?.size.height ?? 350
            return cell
        }
        return UITableViewCell()
    }
}

//MARK: - Table Delegate, DataSource

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelController.profileArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: storyCellID, for: indexPath) as? StoreCollectionViewCell {
            cell.nameLabel.text = modelController.profileArray[indexPath.row].nameProfile
            if let imageProfile = modelController.profileArray[indexPath.row].imageProfile {
                cell.photoImageView.image = UIImage(named: imageProfile)
            }
            cell.photoImageView.layer.cornerRadius = 15
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let tabbar = self.tabBarController
        let navVC = tabbar?.viewControllers?[4] as! UINavigationController
        let profVC = navVC.topViewController as! ProfileViewController
        profVC.idProfile = indexPath.row
        profVC.check = true
        tabbar?.selectedIndex = 4
    }
}
