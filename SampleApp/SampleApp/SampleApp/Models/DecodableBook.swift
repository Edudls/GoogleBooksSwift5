//
//  DecodableBook.swift
//  SampleApp
//
//  Created by Monaghan, Daniel on 4/3/19.
//  Copyright © 2019 Monaghan, Daniel. All rights reserved.
//

import Foundation

struct Root: Decodable {
    let items: [Item]
}

struct Item: Decodable {
    let volumeInfo: VolumeInfo
}

struct VolumeInfo: Decodable {
    let title: String
    let description: String?
    let imageLinks: ImageLinks?
}

struct ImageLinks: Decodable {
    let thumbnail: String?
}
