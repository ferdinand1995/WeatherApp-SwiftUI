//
//  CurrentWeather.swift
//  weather-app
//
//  Created by Tedjakusuma, Ferdinand on 17/04/23.
//

import Foundation

// MARK: - CurrentWeather
struct CurrentWeather: Codable {
    var request: Request?
    var location: Location?
    var current: Current?
    var error: APIErrorCodes?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.request = try container.decodeIfPresent(Request.self, forKey: .request)
        self.location = try container.decodeIfPresent(Location.self, forKey: .location)
        self.current = try container.decodeIfPresent(Current.self, forKey: .current)
        if container.contains(.error) {
            self.error = try container.decodeIfPresent(APIErrorCodes.self, forKey: .error)
        } else {
            self.error = nil
        }
    }
}

// MARK: - Error
struct APIErrorCodes: Codable {
    var code: Int?
    var type, info: String?
}

// MARK: - Current
struct Current: Codable {
    var observationTime: String?
    var temperature, weatherCode: Int?
    var weatherIcons: [String]?
    var weatherDescriptions: [String]?
    var windSpeed, windDegree: Int?
    var windDir: String?
    var pressure, precip, humidity, cloudcover: Int?
    var feelslike, uvIndex, visibility: Int?

    enum CodingKeys: String, CodingKey {
        case observationTime = "observation_time"
        case temperature
        case weatherCode = "weather_code"
        case weatherIcons = "weather_icons"
        case weatherDescriptions = "weather_descriptions"
        case windSpeed = "wind_speed"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressure, precip, humidity, cloudcover, feelslike
        case uvIndex = "uv_index"
        case visibility
    }
}

// MARK: - Location
struct Location: Codable {
    var name, country, region, lat: String?
    var lon, timezoneID, localtime: String?
    var localtimeEpoch: Int?
    var utcOffset: String?

    enum CodingKeys: String, CodingKey {
        case name, country, region, lat, lon
        case timezoneID = "timezone_id"
        case localtime
        case localtimeEpoch = "localtime_epoch"
        case utcOffset = "utc_offset"
    }
}

// MARK: - Request
struct Request: Codable {
    var type, query, language, unit: String?
}
