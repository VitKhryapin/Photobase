//
//  ModelController.swift
//  PhotoChat
//
//  Created by Vitaly Khryapin on 25.03.2022.
//

import Foundation

class ModelController {
    var profileArray = [ModelProfile(nameProfile: "User0", imageProfile: "0"),
                        ModelProfile(nameProfile: "User1", imageProfile: "1"),
                        ModelProfile(nameProfile: "User2", imageProfile: "2"),
                        ModelProfile(nameProfile: "User3", imageProfile: "3"),
                        ModelProfile(nameProfile: "User4", imageProfile: "4"),
                        ModelProfile(nameProfile: "User5", imageProfile: "5"),
                        ModelProfile(nameProfile: "User6", imageProfile: "6"),
                        ModelProfile(nameProfile: "User7", imageProfile: "7"),
    ]
    
    var postArray = [ModelPosts(name: "User0", photoProfile: "0", imagePost: "0-1"),
                     ModelPosts(name: "User1", photoProfile: "1", imagePost: "1-1"),
                     ModelPosts(name: "User1", photoProfile: "1", imagePost: "1-2"),
                     ModelPosts(name: "User1", photoProfile: "1", imagePost: "1-3"),
                     ModelPosts(name: "User1", photoProfile: "1", imagePost: "1-4"),
                     ModelPosts(name: "User1", photoProfile: "1", imagePost: "1-5"),
                     ModelPosts(name: "User1", photoProfile: "1", imagePost: "1-6"),
                     ModelPosts(name: "User1", photoProfile: "1", imagePost: "1-7"),
                     ModelPosts(name: "User1", photoProfile: "1", imagePost: "1-8"),
                     ModelPosts(name: "User1", photoProfile: "1", imagePost: "1-9"),
                     ModelPosts(name: "User2", photoProfile: "2", imagePost: "2-1"),
                     ModelPosts(name: "User2", photoProfile: "2", imagePost: "2-2"),
                     ModelPosts(name: "User3", photoProfile: "3", imagePost: "3-1"),
                     ModelPosts(name: "User3", photoProfile: "3", imagePost: "3-2"),
                     ModelPosts(name: "User4", photoProfile: "4", imagePost: "4-1"),
                     ModelPosts(name: "User4", photoProfile: "4", imagePost: "4-2"),
                     ModelPosts(name: "User5", photoProfile: "5", imagePost: "5-1"),
                     ModelPosts(name: "User6", photoProfile: "6", imagePost: "6-1"),
                     ModelPosts(name: "User6", photoProfile: "6", imagePost: "6-2")
    ].shuffled()
}


