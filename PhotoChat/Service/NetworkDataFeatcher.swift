//
//  NetworkDataFeatcher.swift
//  PhotoChat
//
//  Created by Vitaly Khryapin on 28.03.2022.
//

import Foundation

class NetworkDataFeatcher {
    
    var networkService = NetworkService()
    
    func fetchImages(searchTerm: String, completion: @escaping (SearchResults?) -> ()) {
        networkService.request(searchTerm: searchTerm) { data, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            let decod = self.decodeJSON(type: SearchResults.self, from: data)
            completion(decod)
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        
        do {
            let object = try decoder.decode(type.self, from: data)
            return object
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
}
