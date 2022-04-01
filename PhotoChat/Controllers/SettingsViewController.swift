//
//  SettingsViewController.swift
//  PhotoChat
//
//  Created by Vitaly Khryapin on 01.04.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var newNameTextField: UITextField!
    
    var modelController: ModelController!
    var oldName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oldName = modelController.profileArray[0].nameProfile!
    }
    
    @IBAction func buttonBackAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonSaveAction(_ sender: UIButton) {
        if newNameTextField.text != "" {
            for i in 0...modelController.postArray.count - 1 {
                if modelController.postArray[i].name == oldName {
                    modelController.postArray[i].name = newNameTextField.text
                }
            }
            for i in 0...modelController.profileArray.count - 1 {
                if modelController.profileArray[i].nameProfile == oldName {
                    modelController.profileArray[i].nameProfile = newNameTextField.text
                }
            }
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}
