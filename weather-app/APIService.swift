//
//  APIService.swift
//  WeatherApp
//
//  Created by Tedjakusuma, Ferdinand on 27/02/23.
//

import Moya

enum APIService {
    case forecastAndCurrent(latitude: String, longitude: String)
}

// MARK: - TargetType Protocol Implementation
extension APIService: TargetType {
    var baseURL: URL { URL(string: "http://api.weatherstack.com")! }
    var path: String {
        switch self {
        case .forecastAndCurrent(_, _):
            return "/v1/forecast"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .forecastAndCurrent:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case let .forecastAndCurrent(latitude, longitude):
            return .requestParameters(parameters: [
                "latitude": latitude,
                "longitude": longitude,
                "current_weather": "true",
                "hourly": "temperature_2m,relativehumidity_2m,windspeed_10m"
            ], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
