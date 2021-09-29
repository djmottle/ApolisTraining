//
//  MOVIEDBTests.swift
//  MOVIEDBTests
//
//  Created by David Mottle on 9/24/21.
//

import XCTest
@testable import MOVIEDB

class MOVIEDBTests: XCTestCase {

    var objLoginViewController: LoginViewController?
    
    override func setUp() {
        objLoginViewController = LoginViewController()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        objLoginViewController = nil
    }
    
    func testUsername() {
        
    }

}
