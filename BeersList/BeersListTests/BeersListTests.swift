//
//  BeersListTests.swift
//  BeersListTests
//
//  Created by Alejandro Arce on 9/3/23.
//

import XCTest
@testable import BeersList
import OHHTTPStubs

final class BeersListTests: XCTestCase {
    var jsonStub: HTTPStubsDescriptor?
    var sutBeersListPresenter = BeersListPresenter()
    var sutDelegate = BeersListVCMock()
    
    func test_GetAllBeersOk() {
        let stubPath = OHPathForFile("stubJson.json", type(of: self))!
        jsonStub = stub(condition: isHost("api.punkapi.com")) { _ in
            return HTTPStubsResponse(fileAtPath: stubPath, statusCode: 200, headers: nil)
        }
        sutBeersListPresenter.delegate = sutDelegate
        sutBeersListPresenter.getBeers(foodName: "bee", pageNumber: "1")
        sutDelegate.expGetSendBeers = expectation(description: "get beers")
        waitForExpectations(timeout: 10.0)
        XCTAssertTrue(sutBeersListPresenter.beers.count == 3)
    }
    
    override func setUpWithError() throws {
        removeStub()
    }
    func removeStub() {
        if let jsonStub = jsonStub {
            HTTPStubs.removeStub(jsonStub)
        }
    }
    override func tearDownWithError() throws {
    }

//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}

class BeersListVCMock : BeersListPresenterDelegate {
    var expGetSendBeers: XCTestExpectation?
    func sendBeers(beers: [BeerModel]) {
        expGetSendBeers?.fulfill()
    }
    
    func activateNextButton() {
        print("")
    }
    
    func hideNextButton() {
        print("")
    }
    
    func activatePreviousButton() {
        print("")
    }
    
    func hidePreviousButton() {
        print("")
    }
    
    
}
