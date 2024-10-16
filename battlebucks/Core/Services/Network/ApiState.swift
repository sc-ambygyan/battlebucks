//
//  ApiState.swift
//  battlebucks
//
//  Created by Ambarish Gyanendra on 17/10/24.
//

import Foundation

enum APIState {
    case loading
    case failed(error: Error)
    case success(content: [PhotoModel])
}
