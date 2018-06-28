//
//  MarkdownKitTests.swift
//  MarkdownKitTests
//
//  Created by NishiokaKohei on 2018/06/28.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import XCTest
@testable import MarkdownKit

class MarkdownKitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    

    func testConvert() {

        let path = Bundle(for: MarkdownKitTests.self).path(forResource: "sample", ofType: "md")
        let string = try! String(contentsOfFile: path!)

        MKOperator.convert(with: string)

        let outputPath = Bundle(for: MarkdownKitTests.self).bundlePath + "/" + "output.html"
        MKOperator.output(outputPath)

    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
