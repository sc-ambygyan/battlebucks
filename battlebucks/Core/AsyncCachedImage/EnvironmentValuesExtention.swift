//
//  ImageCacheExtention.swift
//  battlebucks
//
//  Created by Ambarish Gyanendra on 17/10/24.
//

import Foundation
import SwiftUI

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
