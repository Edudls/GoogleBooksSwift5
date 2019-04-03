//
//  NetworkService.swift
//  SampleApp
//
//  Created by Monaghan, Daniel on 4/1/19.
//  Copyright © 2019 Monaghan, Daniel. All rights reserved.
//

import Foundation

class ViewModel {
    
    func search(for keyword: String, completion: @escaping ([Book]) -> ()) {
        
        guard let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=" + keyword) else { return }
        
        NetworkManager.sharedInstance.getBooks(url: url) { books in
            completion(books)
        }
    }
}
