//
//  NetworkManager.swift
//  SampleApp
//
//  Created by Monaghan, Daniel on 4/3/19.
//  Copyright © 2019 Monaghan, Daniel. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static var sharedInstance = NetworkManager()
    
    func getBooks (url: URL, completion: @escaping ([Book]) -> ()) {
        var books = [Book]()
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let jsonData = data else { return }
            
            do {
                let result = try JSONDecoder().decode(Root.self, from: jsonData)
                for item in result.items {
                    books.append(Book(title: item.volumeInfo.title, description: item.volumeInfo.description, thumbnail: item.volumeInfo.imageLinks?.thumbnail))
                }
            } catch {
                print("Uh Oh!")
                print(error.localizedDescription)
            }
            
            completion(books)
        }.resume()
    }
    
    func getImage(with url: URL, completion: @escaping (Data?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            completion(data)
        }.resume()
    }
}
