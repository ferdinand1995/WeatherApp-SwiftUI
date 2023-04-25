//
//  ForecastTests.swift
//  weather-app-tests
//
//  Created by Tedjakusuma, Ferdinand on 18/04/23.
//

import XCTest

@testable import weather_app
final class ForecastTests: XCTestCase {
    
    var sut: Forecast!

    override func setUp() {
        super.setUp()
        let hour: TimeInterval = 60 * 60
        sut = Forecast(date: .init(timeIntervalSinceNow: hour * -1), weather: .rainy, probability: 30, temperature: 19, high: 24, low: 18, location: "Montreal, Canada")

    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testIcon_ShouldMatch() {
        XCTAssertEqual(sut.icon, "Moon cloud mid rain")
        sut.weather = .clear
        XCTAssertEqual(sut.icon, "Moon")
        sut.weather = .cloudy
        XCTAssertEqual(sut.icon, "Cloud")
        sut.weather = .tornado
        XCTAssertEqual(sut.icon, "Tornado")
        sut.weather = .stormy
        XCTAssertEqual(sut.icon, "Sun cloud angled rain")
        sut.weather = .sunny
        XCTAssertEqual(sut.icon, "Sun")
        sut.weather = .windy
        XCTAssertEqual(sut.icon, "Moon cloud fast wind")
    }
}
