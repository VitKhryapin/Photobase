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
   
    let storyCellID = "storyCell"
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
        refresh.endRefreshing()
    }
    
    
}

//MARK: - Delegate, DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelController.postArray.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: storyCellID, for: indexPath) as? StoreTableViewCell {
                tableView.rowHeight = 100
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: postCellID, for: indexPath) as? PostNameTableViewCell {
                let post = modelController.postArray[indexPath.row - 1]
                cell.refresh(post)
                cell.photoProfile.layer.cornerRadius = 25
                tableView.rowHeight = cell.postImage.image?.size.height ?? 350
                return cell
            }
        }
        return UITableViewCell()
    }
}
