//
//  ContentView.swift
//  battlebucks
//
//  Created by Ambarish Gyanendra on 16/10/24.
//

import SwiftUI

struct GalleryScreen: View {
    @StateObject var viewModel: GalleryViewModel = GalleryViewModel(service: NetworkService())
    
    
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: 2)
      
    
    var body: some View {
        Group {
            switch viewModel.apiState {
            case .loading:
                ProgressView()
                
            case .failed(let error):
                ErrorView(error: error) {
                    self.viewModel.getPhotos()
                }
            case .success(let photos):
                NavigationView {
                    ScrollView {
                        LazyVGrid(columns: gridColumns) {
                            ForEach(Array(photos.enumerated()), id: \.offset) { (index, photoInfo) in
                                    NavigationLink(destination: DetailScreen(selectedIndex: index, photos: photos)) {
                                    
                                        AsyncCachedImage(url: URL(string: photoInfo.thumbnailURL)!,
                                                       placeholder: { ProgressView() },
                                                       image: { Image(uiImage: $0).resizable() })
                                        .accessibilityIdentifier("photoId_\(photoInfo.id)")
                                    }
                                .cornerRadius(8.0)
                                .aspectRatio(1, contentMode: .fit)
                            }
                        }
                        .accessibilityIdentifier("photoGrid")
                        .padding()
                    }
                    .navigationBarTitle("Image Gallery")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
        
        .onAppear {
            self.viewModel.getPhotos()
        }
    }
}

#Preview {
    GalleryScreen()
}
