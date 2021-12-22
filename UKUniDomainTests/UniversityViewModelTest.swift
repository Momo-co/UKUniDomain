//
//  UniversityViewModelTest.swift
//  UKUniDomainTests
//
//  Created by Suman Gurung on 22/12/2021.
//

import XCTest
@testable import UKUniDomain

class UniversityViewModelTest: XCTestCase {

    var network: Networking!
    var universityViewModel: UniversityViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        network = MockNetworkManager()
        universityViewModel = UniversityViewModel(network: network)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        network = nil
        universityViewModel = nil
    }

    func testGetUniversitiesSuccess() {
        XCTAssertEqual(universityViewModel.numberOfUniversities, 0)
        universityViewModel.getUniversities(url: "Stub")
        XCTAssertEqual(universityViewModel.numberOfUniversities, 346)
    }
    
    func testGetUniversitiesFail() {
        XCTAssertEqual(universityViewModel.numberOfUniversities, 0)
        universityViewModel.getUniversities(url: "Stub1")
        XCTAssertEqual(universityViewModel.numberOfUniversities, 0)
    }

    func testGetAUniversitySuccess() {
        
        universityViewModel.getUniversities(url: "Stub")
        let universityAtIndexFour = universityViewModel.getAUniversity(index: 4)
        
        let expectedValue = "University of Abertay Dundee"
        let actualValue = universityAtIndexFour.name
        
        XCTAssertEqual(expectedValue, actualValue)
    }
    
    func testGetAUniversityFail() {
        
        universityViewModel.getUniversities(url: "Stub")
        let universityAtNegativeIndex = universityViewModel.getAUniversity(index: -9)
        
        var expectedValue = "Futureworks"
        var actualValue = universityAtNegativeIndex.name
        
        XCTAssertEqual(expectedValue, actualValue)
        
        let universityAtLargeIndex = universityViewModel.getAUniversity(index: 692)
        expectedValue = "Middlesbrough College"
        actualValue = universityAtLargeIndex.name
        
        XCTAssertEqual(expectedValue, actualValue)
    }
}
