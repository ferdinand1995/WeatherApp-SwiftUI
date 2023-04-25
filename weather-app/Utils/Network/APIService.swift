//
//  APIService.swift
//  WeatherApp
//
//  Created by Tedjakusuma, Ferdinand on 27/02/23.
//

import Moya

enum APIService {
    case currentWeather(city: String)
}

// MARK: - TargetType Protocol Implementation
extension APIService: TargetType {
    var baseURL: URL { URL(string: "http://api.weatherstack.com")! }
    var path: String {
        switch self {
        case .currentWeather(_):
            return "/current"
        }
    }

    var method: Moya.Method {
        switch self {
        case .currentWeather:
            return .get
        }
    }

    var task: Task {
        switch self {
        case let .currentWeather(city):
            return .requestParameters(parameters: [
                "access_key": "bd4fab97f34e93e4b58b6721098c6752",
                "query": city
            ], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
