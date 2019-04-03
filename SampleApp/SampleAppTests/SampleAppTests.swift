//
//  SampleAppTests.swift
//  SampleAppTests
//
//  Created by Monaghan, Daniel on 4/1/19.
//  Copyright © 2019 Monaghan, Daniel. All rights reserved.
//

import XCTest
@testable import SampleApp

class SampleAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBookSearch() {
        let promise = expectation(description: "Network call successfully downloads books.")
        let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=test")!
        
        NetworkWorker.sharedInstance.getBooks(url: url) { books in
            if books.count > 0 {
                promise.fulfill()
            }
        }
        
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testImageDownloader() {
        let promise = expectation(description: "Image data downloads successfully.")
        let url = URL(string: "https://books.google.com/books/content?id=TvxEyBcwtCYC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api")!
        
        NetworkWorker.sharedInstance.getImage(with: url) { data in
            if let _ = data {
                promise.fulfill()
            }
        }
        
        waitForExpectations(timeout: 2, handler: nil)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
