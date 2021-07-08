//
//  API.swift
//  NetworkingSwiftUI
//
//  Created by Ahmad Shahir Abdul Satar on 7/8/21.
//

import Foundation
import SwiftUI
import Combine


class API: ObservableObject {
    @Published var posts: [Photo] = []
    var cancellables = Set<AnyCancellable>()
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://picsum.photos/v2/list") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
//            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [Photo].self, decoder: JSONDecoder())
            .sink { (completion) in
            } receiveValue: { [weak self] (returnedPosts) in
                self?.posts = returnedPosts
            }
            .store(in: &cancellables)
    }
    
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}
