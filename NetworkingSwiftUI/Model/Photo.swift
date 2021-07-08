//
//  Photo.swift
//  NetworkingSwiftUI
//
//  Created by Ahmad Shahir Abdul Satar on 7/8/21.
//

import Foundation

struct Photo: Codable, Identifiable {
    let id: String
    let author: String
    let width, height: Int
    let url, download_url: URL
}
