//
//  LuluLemonCopyTests.swift
//  LuluLemonCopyTests
//
//  Created by David Mottle on 10/19/21.
//

import XCTest
@testable import LuluLemonCopy

class LuluLemonCopyTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        //restoreDB()
    }

    func testExample() {
        let listVM = ListViewModel()
        let addVM = AddViewModel()
        listVM.fetchDataFromDB(sortIndex: 0)
        let count = listVM.garments.count
        
        addVM.saveDataToDB(name: "testGarment1")
        listVM.fetchDataFromDB(sortIndex: 1)
        XCTAssertEqual(listVM.getGarmentName(index: count), "testGarment1")
        print(listVM.getGarmentCount())
        
    }
    
    func testDelete() {
        let listVM = ListViewModel()
        let addVM = AddViewModel()
        
        listVM.fetchDataFromDB(sortIndex: 0)
        let gCount = listVM.getGarmentCount()
        for garment in 0 ..< gCount {
            listVM.deleteGarment(index: 0)
            listVM.fetchDataFromDB(sortIndex: 0)
        }
        addVM.saveDataToDB(name: "test")
        listVM.fetchDataFromDB(sortIndex: 1)
        let count = listVM.garments.count
        
        listVM.deleteGarment(index: 0)
        listVM.fetchDataFromDB(sortIndex: 0)
        XCTAssertEqual(listVM.garments.count, 0)
        print((listVM.getGarmentCount()))
    }
    
    func testGetCount() {
        let listVM = ListViewModel()
        listVM.fetchDataFromDB(sortIndex: 0)
        let gCount = listVM.getGarmentCount()
        for garment in 0 ..< gCount {
            listVM.deleteGarment(index: 0)
            listVM.fetchDataFromDB(sortIndex: 0)
        }

        listVM.garments = [Garment(),Garment(),Garment(),Garment()]
        XCTAssertEqual(listVM.getGarmentCount(), 4)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
