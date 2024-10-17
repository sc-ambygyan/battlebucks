//
//  DetailScreen1.swift
//  battlebucks
//
//  Created by Ambarish Gyanendra on 17/10/24.
//

import SwiftUI

struct DetailScreen: View {
     let selectedIndex: Int
    let photos: PhotoModelList
    
    @State private var selectedPhoto: PhotoModel?
    
    var body: some View {
        VStack {
                 ScrollView(.horizontal) {
                     LazyHStack {
                         ForEach(photos, id: \.id) { photoInfo in
                             imageViewWithData(for: photoInfo)
                         }
                         .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                     }
                     .scrollTargetLayout()
                 }
                 .scrollTargetBehavior(.viewAligned)
                 .scrollPosition(id: $selectedPhoto)
                 .scrollIndicators(.never)
             }
             .onAppear {
                 selectedPhoto = photos[selectedIndex]
             }
    }
    
    func imageViewWithData(for photoInfo: PhotoModel) -> some View {
        VStack(alignment: .leading) {
            Spacer()
            AsyncCachedImage(url: URL(string: photoInfo.thumbnailURL)!,
                           placeholder: { ProgressView() },
                           image: { Image(uiImage: $0).resizable() })
            .frame(maxWidth: .infinity)
            .background(.background)
            .cornerRadius(10)
            .shadow(radius: 10)
            Spacer()
            Group {
                Text("Title: \(photoInfo.title)")
                Text("Url: \(photoInfo.url)")
                    }
            .padding(.leading, 8)
            .padding(.bottom, 8)
            
        }
        .padding()
      }
    }

