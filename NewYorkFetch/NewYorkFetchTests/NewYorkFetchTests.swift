//
//  NewYorkFetchTests.swift
//  NewYorkFetchTests
//
//  Created by David Mottle on 10/20/21.
//

import XCTest
@testable import NewYorkFetch

class NewYorkFetchTests: XCTestCase {
    var vm: ViewModel?


    override func setUpWithError() throws {
        vm = ViewModel.init()
    }

    override func tearDownWithError() throws {
        vm = nil
    }
    
//    func testGet() {
//        XCTAssert(((vm?.get {}) != nil))
//    }
    
    func testGet() {
        let exp = expectation(description: "Get")
        vm?.get {
            exp.fulfill()
        }
        waitForExpectations(timeout: 5)
    }

    func testGetCount() {
        XCTAssertEqual(vm?.getCount(),0)
        
        vm?.get {
            DispatchQueue.main.async {
                let arr = self.vm?.getDataArray()
                XCTAssertEqual(arr?.results?.count, self.vm?.getCount())
            }
        }
    }

    func testGetError() {
        XCTAssertNil(vm?.getError())
        let exp = expectation(description: "Get")
        vm?.get {
            exp.fulfill()
            XCTAssertNotNil(self.vm?.getError())
        }
        waitForExpectations(timeout: 5)
    }
    
    func testGetDate() {
        XCTAssertNil(vm?.getDate(index: 0))
        vm?.get {
            DispatchQueue.main.async {
                let arr = self.vm?.getDataArray()
                let testDate = arr?.results?[27].title.convertToDateFormat(current: "yyyy-MM-dd'T'HH:mm:ssZZZZZ", convertTo: "MM-dd-yyyy")
                XCTAssertEqual(self.vm?.getDate(index: 307), testDate)
            }
        }
    }
    func testGetURL() {
        XCTAssertNil(vm?.getURL(index: 0))
        vm?.get {
            DispatchQueue.main.async {
                let arr = self.vm?.getDataArray()
                XCTAssertEqual(self.vm?.getURL(index: 207), arr?.results?[207].url)
            }
        }
    }
    
    func testGetByline() {
        XCTAssertNil(vm?.getByline(index: 0))
        vm?.get {
            DispatchQueue.main.async {
                let arr = self.vm?.getDataArray()
                XCTAssertEqual(self.vm?.getByline(index: 5), arr?.results?[5].byline)
            }
        }
    }
}
