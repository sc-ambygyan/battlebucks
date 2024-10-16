//
//  ApiEndpoint.swift
//  battlebucks
//
//  Created by Ambarish Gyanendra on 16/10/24.
//

import Foundation

protocol APIBuilderProtocol {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum ApiEndpoint {
    case photos
}

extension ApiEndpoint: APIBuilderProtocol {

    var baseUrl: URL {
        let baseUrl = "https://jsonplaceholder.typicode.com"
        switch self {
        case .photos:
            return URL(string: baseUrl)!
        }
    }
    
    var path: String {
        switch self {
        case .photos:
            return "/photos"

        }
    }
    
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
    }
}
