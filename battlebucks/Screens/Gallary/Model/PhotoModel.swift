//
//  PhotoModel.swift
//  battlebucks
//
//  Created by Ambarish Gyanendra on 16/10/24.
//

import Foundation

// MARK: - PhotoModelElement
struct PhotoModel: Codable {
    let albumID: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id = "id"
        case title = "title"
        case url = "url"
        case thumbnailURL = "thumbnailUrl"
    }
}

typealias PhotoModelList = [PhotoModel]
