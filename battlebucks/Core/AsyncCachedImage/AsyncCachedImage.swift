//
//  AsyncCachedImage.swift
//  battlebucks
//
//  Created by Ambarish Gyanendra on 17/10/24.
//

import Foundation
import SwiftUI
import UIKit
import Combine

struct AsyncCachedImage<Placeholder: View>: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: Placeholder
    private let image: (UIImage) -> Image
    
    init(
        url: URL,
        @ViewBuilder placeholder: () -> Placeholder,
        @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:)
    ) {
        self.placeholder = placeholder()
        self.image = image
        _loader = StateObject(wrappedValue: ImageLoader(url: url, cache: Environment(\.imageCache).wrappedValue))
    }
    
    var body: some View {
        content
            .onAppear(perform: loader.load)
    }
    
    private var content: some View {
        ZStack(alignment: .center) {
            if loader.image != nil {
                image(loader.image!)
                    .resizable()
                    .scaledToFit()
            } else {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        placeholder
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
    }
}








