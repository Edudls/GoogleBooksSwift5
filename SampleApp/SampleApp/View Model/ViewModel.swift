//
//  NetworkService.swift
//  SampleApp
//
//  Created by Monaghan, Daniel on 4/1/19.
//  Copyright © 2019 Monaghan, Daniel. All rights reserved.
//

import Foundation

class ViewModel {
    
    var books: [Book]
    
    init() {
        books = []
    }
    
    func search(for keyword: String, completion: @escaping () -> ()) {
        
        guard let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=" + keyword) else { return }
        
        NetworkWorker.sharedInstance.getBooks(url: url) { books in
            self.books = books
            completion()
        }
    }
}
