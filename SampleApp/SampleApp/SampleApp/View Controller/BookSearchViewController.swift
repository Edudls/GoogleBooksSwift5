//
//  ViewController.swift
//  SampleApp
//
//  Created by Monaghan, Daniel on 4/1/19.
//  Copyright © 2019 Monaghan, Daniel. All rights reserved.
//

import UIKit

final class BookSearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let vm = ViewModel()
    
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

extension BookSearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let query = searchBar.text else { return }
        
        vm.search(for: query) { [weak self] in
            DispatchQueue.main.async{
                self?.tableView.reloadData()
            }
        }
        
        self.view.endEditing(true)
    }
}

extension BookSearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.books.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as? BookTableViewCell
        let book = vm.books[indexPath.row]
        cell?.configure(with: book)
        
        return cell ?? BookTableViewCell()
    }
}

extension BookSearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        vm.openDetailView(index: indexPath.row, storyboard: storyboard, navigationController: navigationController)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.tableViewRowHeight
    }
}
