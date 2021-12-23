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
    
    func testUKUni() {
        let app = XCUIApplication()
        app.launch()
        let ukUniversitiesStaticText = app.navigationBars["UK Universities"].staticTexts["UK Universities"]
        
        XCTAssertTrue(ukUniversitiesStaticText.exists)
        
        let tablesQuery = app.tables
        
        XCTAssertTrue(tablesQuery.firstMatch.exists)
        
        let futureworksStaticText = tablesQuery.children(matching: .cell).element(boundBy: 0).staticTexts["Futureworks"]
        
        XCTAssertTrue(futureworksStaticText.waitForExistence(timeout: 30))
        
    }
    
    func testUKUniDomain() {
        
        let app = XCUIApplication()
        app.launch()
        let ukUniversitiesStaticText = app.navigationBars["UK Universities"].staticTexts["UK Universities"]
        
        XCTAssertTrue(ukUniversitiesStaticText.exists)
        
        let tablesQuery = app.tables
        
        XCTAssertTrue(tablesQuery.firstMatch.exists)
        
        let futureworksStaticText = tablesQuery.children(matching: .cell).element(boundBy: 0).staticTexts["Futureworks"]
        
        XCTAssertTrue(futureworksStaticText.waitForExistence(timeout: 30))
        
        futureworksStaticText.tap()
        
        let universityDetailsNavigationBar = app.navigationBars["University Details"]
        let titleBar = universityDetailsNavigationBar.staticTexts["University Details"]
        
        XCTAssertTrue(titleBar.exists)
        
        let univerisityName = app.staticTexts["Futureworks"]
        
        XCTAssertTrue(univerisityName.exists)
        
        let websiteTitleCell = tablesQuery.staticTexts["Websites"]
        
        XCTAssertTrue(websiteTitleCell.exists)
        
        let domainTitleCell = tablesQuery.staticTexts["Domains"]
        
        XCTAssertTrue(domainTitleCell.exists)
        
        let domainName = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["futureworks.ac.uk"]/*[[".cells.staticTexts[\"futureworks.ac.uk\"]",".staticTexts[\"futureworks.ac.uk\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        XCTAssertTrue(domainName.exists)
        
        let backButton = universityDetailsNavigationBar.buttons["UK Universities"]
        
        XCTAssertTrue(backButton.exists)
        
    }

}
