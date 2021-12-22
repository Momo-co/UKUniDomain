//
//  UniversityListViewControllerTests.swift
//  UKUniDomainUITests
//
//  Created by Suman Gurung on 22/12/2021.
//

import XCTest
import SnapshotTesting
@testable import UKUniDomain

class UniversityListViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUniversityListViewController() {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let sut = storyBoard.instantiateViewController(withIdentifier: "universityListViewController")
        
        print(storyBoard)
        
        let devices: [String: ViewImageConfig] = ["iPhoneX": .iPhoneX, "iPhone8": .iPhone8, "iPhoneSE": .iPhoneSe]
        
        let results = devices.map { device in
            verifySnapshot(matching: sut, as: .image(on: device.value), named: "Default-\(device.key)", testName: "testUniversityViewController")
        }
        
        results.forEach {XCTAssertNil($0)}
    }

}
