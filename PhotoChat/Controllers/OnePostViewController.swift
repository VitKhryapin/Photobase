//
//  OnePostViewController.swift
//  PhotoChat
//
//  Created by Vitaly Khryapin on 27.03.2022.
//

import UIKit

class OnePostViewController: UIViewController {

    @IBOutlet weak var imagePost: UIImageView!
    @IBOutlet weak var shareButtonOutlet: UIButton!
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shareButtonOutlet.layer.cornerRadius = 5
        imagePost.image = image
    }
    
    @IBAction func shareActionButton(_ sender: UIButton) {
        let shareController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        shareController.completionWithItemsHandler = { _, bool, _, _ in
            if bool {
                print("Успешно")
            }
        }
        present(shareController, animated: true, completion: nil)
    }
    
    @IBAction func backVC(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
}
