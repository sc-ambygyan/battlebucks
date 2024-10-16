//
//  APIError.swift
//  battlebucks
//
//  Created by Ambarish Gyanendra on 16/10/24..
//
import Foundation

enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .decodingError:
            return "data parsing failed"
        case .errorCode(let code):
            return "encountered error code: \(code)"
        case .unknown:
            return "Something went wrong"
        }
    }
}
