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
        
        NetworkWorker.sharedInstance.getImage(with: book.thumbnail) { [weak self] data in
            DispatchQueue.main.async{
                if let imageData = data {
                    self?.thumbnail.image = UIImage(data: imageData)
                } else {
                    self?.thumbnail.image = nil
                }
            }
        }
    }
}

