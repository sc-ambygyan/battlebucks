//
//  .swift
//  battlebucks
//
//  Created by Ambarish Gyanendra on 16/10/24.
//

import Foundation
import Combine

protocol GalleryViewModelProtocol {
    func getPhotos()
}

class GalleryViewModel: ObservableObject, GalleryViewModelProtocol {
    @Published private(set) var apiState: APIState = .loading
    private var cancellables = Set<AnyCancellable>()
    
    private let service: NetworkServiceProtocol
    private(set) var photos = [PhotoModel]()
    
    init(service: NetworkServiceProtocol) {
        self.service = service
    }
    
    func getPhotos() {
        self.apiState = .loading
        let cancellable = self.service
            .request(from: .photos)
            .sink { (res) in
                switch res {
                case .failure(let error):
                    self.apiState = .failed(error: error)
                case .finished:
                    self.apiState = .success(content: self.photos)
                }
            } receiveValue: { res in
                self.photos = res
            }
        self.cancellables.insert(cancellable)
    }
}
