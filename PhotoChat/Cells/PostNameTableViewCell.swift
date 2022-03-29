//
//  PostNameTableViewCell.swift
//  PhotoChat
//
//  Created by Vitaly Khryapin on 25.03.2022.
//

import UIKit

class PostNameTableViewCell: UITableViewCell {
    @IBOutlet weak var photoProfile: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    public func refresh(_ post: ModelPosts) {
        if let photo = post.photoProfile, let imagePost = post.imagePost {
            photoProfile.image = UIImage(named: photo)
            nameLabel.text = post.name
            postImage.image = UIImage(named: imagePost)
        }
    }

}
