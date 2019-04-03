//
//  ViewController.swift
//  SampleApp
//
//  Created by Monaghan, Daniel on 4/1/19.
//  Copyright © 2019 Monaghan, Daniel. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let vm = ViewModel()
    var books = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    func setupViewController() {
        
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        let cellNib = UINib(nibName: "BookTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "bookCell")
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let query = searchBar.text else { return }
        
        vm.search(for: query) { books in
            self.books = books
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
        self.view.endEditing(true)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.books.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BookTableViewCell
        let book = self.books[indexPath.row]
        cell.configure(with: book)
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
}
