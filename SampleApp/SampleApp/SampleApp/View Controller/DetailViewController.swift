//
//  DetailViewController.swift
//  SampleApp
//
//  Created by Monaghan, Daniel on 4/4/19.
//  Copyright © 2019 Monaghan, Daniel. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var vm: ViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let book = vm?.selectedBook {
            setupViewController(with: book)
        }
    }
    
    func setupViewController(with book: Book) {
        self.titleLabel.text = book.title
        self.descriptionTextView.text = book.description
        NetworkWorker.sharedInstance.getImage(with: book.thumbnail) { [weak self] data in
            DispatchQueue.main.async {
                if let imageData = data {
                    self?.imageView.image = UIImage(data: imageData)
                } else {
                    self?.imageView.image = nil
                }
            }
        }
    }
}
