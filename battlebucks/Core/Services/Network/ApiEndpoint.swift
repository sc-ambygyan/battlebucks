//
//  ArticleEndpoint.swift
//  NewsAPI
//
//  Created by Tunde on 08/02/2021.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum ApiEndpoint {
    case getNews
}

extension ApiEndpoint: APIBuilder {

    var baseUrl: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.lil.software")!
        }
    }
    
    var path: String {
        switch self {
        case .getNews:
            return "/news"

        }
    }
    
    var urlRequest: URLRequest {
        switch self {
        case .getNews:           
            return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
        }
    }
}
