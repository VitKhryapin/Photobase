//
//  ProfileViewController.swift
//  PhotoChat
//
//  Created by Vitaly Khryapin on 30.03.2022.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    var modelController = ModelController()
    var idProfile = 0
    var check = false
    private let itemsPerRow: CGFloat = 3
    private let sectionInserts = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    private var photos = [ModelPosts]()
    
    //MARK: - CreateElements
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    let photoProfile: UIImageView = {
        let photoImage = UIImageView()
        photoImage.backgroundColor = .gray
        photoImage.contentMode = .scaleAspectFill
        photoImage.clipsToBounds = true
        photoImage.layer.cornerRadius = 50
        photoImage.translatesAutoresizingMaskIntoConstraints = false
        return photoImage
    }()
    
    let subscribtionLabel: UILabel = {
       let label = UILabel()
        label.text = "Подписки"
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let countSubscribtionLabel: UILabel = {
       let label = UILabel()
        label.text = "\(Int.random(in: 0...200))"
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let storeLabel: UILabel = {
       let label = UILabel()
        label.text = "Публикации"
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let countStoreLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subscribeLabel: UILabel = {
       let label = UILabel()
        label.text = "Подписчики"
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let countSubscribeLabel: UILabel = {
       let label = UILabel()
        label.text = "\(Int.random(in: 0...300))"
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var collectionView = UICollectionView (frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    //MARK: - ViewLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if check {
            setupNavigationBar()
            setupPhotoProfile()
            check = false
        } else {
            idProfile = 0
            setupNavigationBar()
            setupPhotoProfile()
        }
        createConstrants()
        setupCollectionView()
        
    }
    
    private func countStore() -> Int {
        let nameProfile = modelController.profileArray[idProfile].nameProfile
        var countStore = 0
        for i in modelController.postArray {
            if i.name == nameProfile {
                countStore += 1
            }
        }
        return countStore
    }
    
    
    // MARK: - NavBar
    private func setupNavigationBar() {
        if let profile = modelController.profileArray[idProfile].nameProfile {
            titleLabel.text = profile
            let imageButton = UIImage(systemName: "arrowtriangle.down.square")
            let downArrow = UIBarButtonItem.init(image: imageButton, style: .plain, target: nil, action: nil)
            downArrow.tintColor = .white
            navigationItem.leftBarButtonItems = [UIBarButtonItem.init(customView: titleLabel), downArrow]
        }
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .black
        collectionView.register(StoryProfileCollectionViewCell.self, forCellWithReuseIdentifier: StoryProfileCollectionViewCell.reuseId)
        collectionView.layoutMargins = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        collectionView.contentInsetAdjustmentBehavior = .automatic
        collectionView.allowsMultipleSelection = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.reloadData()
    }
    
    // MARK: - Constraints
    private func createConstrants() {
        setupPhotoProfile()
        createStoreLabel()
        createCountStoreLabel()
        createSubscribeLabel()
        createCountSubscribeLabel()
        createSubscribtionLabel()
        createCountSubscribtionLabel()
        createConstrainCollectionView()
    }
    
    private func setupPhotoProfile() {
        if let profile = modelController.profileArray[idProfile].imageProfile {
            photoProfile.image = UIImage(named: profile)
        }
        view.addSubview(photoProfile)
        photoProfile.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        photoProfile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        photoProfile.widthAnchor.constraint(equalToConstant: 100).isActive = true
        photoProfile.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func createStoreLabel() {
        view.addSubview(storeLabel)
        storeLabel.leadingAnchor.constraint(equalTo: photoProfile.trailingAnchor, constant: 40).isActive = true
        storeLabel.centerYAnchor.constraint(equalTo: photoProfile.centerYAnchor, constant: 0).isActive = true
    }
    
    private func createCountStoreLabel() {
        countStoreLabel.text = "\(countStore())"
        view.addSubview(countStoreLabel)
        countStoreLabel.centerXAnchor.constraint(equalTo: storeLabel.centerXAnchor, constant: 0).isActive = true
        countStoreLabel.bottomAnchor.constraint(equalTo: storeLabel.topAnchor, constant: -5).isActive = true
    }
    
    private func createSubscribeLabel() {
        view.addSubview(subscribeLabel)
        subscribeLabel.leadingAnchor.constraint(equalTo: storeLabel.trailingAnchor, constant: 20).isActive = true
        subscribeLabel.centerYAnchor.constraint(equalTo: photoProfile.centerYAnchor, constant: 0).isActive = true
    }
    
    private func createCountSubscribeLabel() {
        view.addSubview(countSubscribeLabel)
        countSubscribeLabel.centerXAnchor.constraint(equalTo: subscribeLabel.centerXAnchor, constant: 0).isActive = true
        countSubscribeLabel.bottomAnchor.constraint(equalTo: subscribeLabel.topAnchor, constant: -5).isActive = true
    }
    
    private func createSubscribtionLabel() {
        view.addSubview(subscribtionLabel)
        subscribtionLabel.leadingAnchor.constraint(equalTo: subscribeLabel.trailingAnchor, constant: 20).isActive = true
        subscribtionLabel.centerYAnchor.constraint(equalTo: photoProfile.centerYAnchor, constant: 0).isActive = true
    }
    
    private func createCountSubscribtionLabel() {
        view.addSubview(countSubscribtionLabel)
        countSubscribtionLabel.centerXAnchor.constraint(equalTo: subscribtionLabel.centerXAnchor, constant: 0).isActive = true
        countSubscribtionLabel.bottomAnchor.constraint(equalTo: subscribtionLabel.topAnchor, constant: -5).isActive = true
    }
    
    private func createConstrainCollectionView() {
        view.addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: photoProfile.bottomAnchor, constant: 20).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}


//MARK: - UICollectionViewDataSource, Delegate

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countStore()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryProfileCollectionViewCell.reuseId, for: indexPath) as! StoryProfileCollectionViewCell
        photos = modelController.postArray.filter{Int($0.photoProfile!) == idProfile}
        cell.imageView.image = UIImage(named: photos[indexPath.item].imagePost!)
        return cell
    }
}


// MARK: - UICollectionViewDelegateFlowLayout

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
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
