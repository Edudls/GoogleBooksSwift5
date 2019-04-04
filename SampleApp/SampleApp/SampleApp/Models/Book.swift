//
//  Book.swift
//  SampleApp
//
//  Created by Monaghan, Daniel on 4/1/19.
//  Copyright © 2019 Monaghan, Daniel. All rights reserved.
//

import Foundation

struct Book {
    var title: String
    var description: String
    var thumbnail: String?
    
    init(title: String, description: String?, thumbnail: String?) {
        self.title = title
        self.description = description ?? "No description available."
        self.thumbnail = thumbnail
    }
}
