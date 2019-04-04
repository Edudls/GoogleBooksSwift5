//
//  NetworkService.swift
//  SampleApp
//
//  Created by Monaghan, Daniel on 4/1/19.
//  Copyright © 2019 Monaghan, Daniel. All rights reserved.
//

import UIKit

class ViewModel {
    
    var books: [Book]
    var selectedBook: Book?
    
    init() {
        books = []
    }
    
    func search(for keyword: String, completion: @escaping () -> ()) {
        
        guard let url = URL(string: Constants.searchURL + keyword) else { return }
        
        NetworkWorker.sharedInstance.getBooks(url: url) { [weak self] books in
            self?.books = books
            completion()
        }
    }
    
    func openDetailView(index: Int, storyboard: UIStoryboard?, navigationController: UINavigationController?) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        vc.vm = self
        self.selectedBook = books[index]
        navigationController?.pushViewController(vc, animated: true)
    }
}
