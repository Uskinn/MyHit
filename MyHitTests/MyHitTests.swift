//
//  MyHitTests.swift
//  MyHitTests
//
//  Created by Sergey Nevzorov on 9/14/16.
//  Copyright © 2016 Sergey Nevzorov. All rights reserved.
//

import XCTest

class MyHitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMovieMapping() {
        
        let movieDictionary = ["Title": "Taxi", "Poster": "http://test.com"] as NSDictionary
    
        let movie = Movie.mapFromDictionary(movieDictionary)
        
        XCTAssertEqual(movie.title, "Taxi")
        XCTAssertEqual(movie.poster, "http://test.com")
    }
}
