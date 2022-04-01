//
//  ModelController.swift
//  PhotoChat
//
//  Created by Vitaly Khryapin on 25.03.2022.
//

import Foundation

class ModelController {
    var profileArray = [ModelProfile(nameProfile: "MyProfile", imageProfile: "0"),
                        ModelProfile(nameProfile: "Wife", imageProfile: "1"),
                        ModelProfile(nameProfile: "Tima", imageProfile: "2"),
                        ModelProfile(nameProfile: "Artem", imageProfile: "3"),
                        ModelProfile(nameProfile: "Arthur", imageProfile: "4"),
                        ModelProfile(nameProfile: "Dasha", imageProfile: "5"),
                        ModelProfile(nameProfile: "Roma", imageProfile: "6"),
                        ModelProfile(nameProfile: "Sergey", imageProfile: "7"),
    ]
    
    var postArray = [ModelPosts(name: "MyProfile", photoProfile: "0", imagePost: "0-1"),
                     ModelPosts(name: "Wife", photoProfile: "1", imagePost: "1-1"),
                     ModelPosts(name: "Wife", photoProfile: "1", imagePost: "1-2"),
                     ModelPosts(name: "Wife", photoProfile: "1", imagePost: "1-3"),
                     ModelPosts(name: "Wife", photoProfile: "1", imagePost: "1-4"),
                     ModelPosts(name: "Wife", photoProfile: "1", imagePost: "1-5"),
                     ModelPosts(name: "Wife", photoProfile: "1", imagePost: "1-6"),
                     ModelPosts(name: "Wife", photoProfile: "1", imagePost: "1-7"),
                     ModelPosts(name: "Wife", photoProfile: "1", imagePost: "1-8"),
                     ModelPosts(name: "Wife", photoProfile: "1", imagePost: "1-9"),
                     ModelPosts(name: "Tima", photoProfile: "2", imagePost: "2-1"),
                     ModelPosts(name: "Tima", photoProfile: "2", imagePost: "2-2"),
                     ModelPosts(name: "Artem", photoProfile: "3", imagePost: "3-1"),
                     ModelPosts(name: "Artem", photoProfile: "3", imagePost: "3-2"),
                     ModelPosts(name: "Arthur", photoProfile: "4", imagePost: "4-1"),
                     ModelPosts(name: "Arthur", photoProfile: "4", imagePost: "4-2"),
                     ModelPosts(name: "Dasha", photoProfile: "5", imagePost: "5-1"),
                     ModelPosts(name: "Roma", photoProfile: "6", imagePost: "6-1"),
                     ModelPosts(name: "Roma", photoProfile: "6", imagePost: "6-2")
    ].shuffled()
}


