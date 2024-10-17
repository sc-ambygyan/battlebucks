//
//  MockNetworkService.swift
//  battlebucksTests
//
//  Created by Ambarish Gyanendra on 17/10/24.
//

import Foundation
import Combine
@testable import battlebucks


struct MockNetworkService: NetworkServiceProtocol {
    
    var result: Result<PhotoModelList, APIError>!

    func request(from endpoint: ApiEndpoint) -> AnyPublisher<PhotoModelList, APIError> {
        
        guard let jsonData = readLocalPhotosFile() else {
            return Fail(error: .unknown)
                    .eraseToAnyPublisher()
                }
        
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .iso8601
                  
            return Just(jsonData)
                .decode(type: PhotoModelList.self, decoder: jsonDecoder)
                .mapError {_ in .decodingError}
                .eraseToAnyPublisher()
    }
    
    
    
    private func readLocalPhotosFile() -> Data? {
           do {
               guard let fileUrl =  Bundle.main.url(forResource: "Photos", withExtension: "json") else {
                   return nil
               }
               let data = try Data(contentsOf: fileUrl)
               return data
           } catch let error {
               print(error.localizedDescription)
               return nil
           }
       }
}

