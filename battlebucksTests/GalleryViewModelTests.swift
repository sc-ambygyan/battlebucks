//
//  GalleryViewModelTests.swift
//  battlebucksTests
//
//  Created by Ambarish Gyanendra on 17/10/24.
//

import XCTest
@testable import battlebucks

class GalleryViewModelTests: XCTest {
    
    func test_getPhotos_success() {
            let mockNetWorkService = GalleryViewModel(service: MockNetworkService())
        mockNetWorkService.getPhotos()
        XCTAssert(!mockNetWorkService.photos.isEmpty)
        }
    
    func test_getPhotos_failed() {
        var failedService = MockNetworkService()
        failedService.result = .failure(.unknown)
            let mockNetWorkService = GalleryViewModel(service: MockNetworkService())
        mockNetWorkService.getPhotos()
        XCTAssert(!mockNetWorkService.photos.isEmpty)
        }
}
