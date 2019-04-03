//
//  BookTableViewCell.swift
//  SampleApp
//
//  Created by Monaghan, Daniel on 4/2/19.
//  Copyright © 2019 Monaghan, Daniel. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    
    func configure(with book: Book) {
        
        self.titleLabel.text = book.title
        self.descLabel.text = book.description
        
        if let urlString = book.thumbnail,
            let url = URL(string: urlString.replacingOccurrences(of: "http", with: "https")) {
            NetworkWorker.sharedInstance.getImage(with: url) { data in
                if let imageData = data {
                    DispatchQueue.main.async{
                        self.thumbnail.image = UIImage(data: imageData)
                    }
                }
            }
        } else {
            self.thumbnail.image = nil
        }
    }
}

