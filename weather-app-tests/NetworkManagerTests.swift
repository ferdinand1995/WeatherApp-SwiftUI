//
//  NetworkManagerTests.swift
//  weather-app-tests
//
//  Created by Tedjakusuma, Ferdinand on 17/04/23.
//

import XCTest

@testable import weather_app
final class NetworkManagerTests: XCTestCase {

    var sut: NetworkManager!

    override func setUp() {
        super.setUp()
        sut = NetworkManager()
    }

    override func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testClass_ShouldNotEmpty() {
        XCTAssertNotNil(sut != nil)
    }

    func testAsync_ShouldHaveReceived() {
        let expectation = expectation(description: "SomeService does stuff and runs the callback closure")

        sut.provider.request(.currentWeather(city: "New York")) { result in
            switch result {
            case let .success(responses):
                XCTAssertEqual(responses.statusCode, 200)
            case let .failure(error):
                XCTFail("error == \(error.localizedDescription)")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 3) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
    func testParseData_ShouldHaveValue() {
        let expectation = expectation(description: "Parse data successfull")

        sut.provider.request(.currentWeather(city: "New York")) { result in
            switch result {
            case let .success(responses):
                let data = responses.data
                XCTAssertEqual(responses.statusCode, 200)
                let currentWeather = try? JSONDecoder().decode(CurrentWeather.self, from: data)
                XCTAssertEqual(currentWeather?.location?.name, "New York")
            case let .failure(error):
                XCTFail("error == \(error.localizedDescription)")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 3) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
    func testParseData_ThrowAPIErrorCode() {
        let expectation = expectation(description: "Parse data successfull")

        sut.provider.request(.currentWeather(city: "")) { result in
            switch result {
            case let .success(responses):
                let data = responses.data
                XCTAssertEqual(responses.statusCode, 200)
                let currentWeather = try? JSONDecoder().decode(CurrentWeather.self, from: data)
                XCTAssertNil(currentWeather?.location)
                XCTAssertNotNil(currentWeather?.error?.code)
                XCTAssertEqual(currentWeather?.error?.code, 601)
            case let .failure(error):
                XCTFail("error == \(error.localizedDescription)")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 3) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }

}
