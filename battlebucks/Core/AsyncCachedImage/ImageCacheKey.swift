//
//  ImageCacheKey.swift
//  battlebucks
//
//  Created by Ambarish Gyanendra on 17/10/24.
//

import Foundation
import SwiftUI


struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TemporaryImageCache()
}
