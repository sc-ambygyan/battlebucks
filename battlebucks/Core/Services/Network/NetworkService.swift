//
//  NetworkService.swift
//  battlebucks
//
//  Created by Ambarish Gyanendra on 16/10/24.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
     func request(from endpoint: ApiEndpoint) -> AnyPublisher<PhotoModelList, APIError>
}

struct NetworkService: NetworkServiceProtocol {

    func request(from endpoint: ApiEndpoint) -> AnyPublisher<PhotoModelList, APIError> {
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        return URLSession.shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in .unknown }
            .flatMap { data, response -> AnyPublisher<PhotoModelList, APIError> in

                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: .unknown)
                            .eraseToAnyPublisher()
                }

                if (200...299).contains(response.statusCode) {
                    return Just(data)
                        .decode(type: PhotoModelList.self, decoder: jsonDecoder)
                        .mapError {_ in .decodingError}
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: .errorCode(response.statusCode))
                            .eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
}
