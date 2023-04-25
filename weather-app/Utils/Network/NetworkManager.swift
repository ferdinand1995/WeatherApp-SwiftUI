//
//  WeatherForecastService.swift
//  weather-app
//
//  Created by Tedjakusuma, Ferdinand on 28/02/23.
//

import Moya

protocol Networkable {
    var provider: MoyaProvider<APIService> { get }

}

class NetworkManager: Networkable {
    var provider = MoyaProvider<APIService>(plugins: [NetworkLoggerPlugin()])

}

private extension NetworkManager {
    private func request<T: Decodable>(target: APIService, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
