//
//  ContentView.swift
//  NetworkingSwiftUI
//
//  Created by Ahmad Shahir Abdul Satar on 7/8/21.
//

import SwiftUI
import URLImage


struct ContentView: View {
    @StateObject var vm = API()
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.posts) { post in
                    NavigationLink(
                        destination: URLImage(post.download_url) { image in
                            image.resizable().aspectRatio(contentMode: .fit)
                        },
                        label: {
                            Text(post.author)
                        })
                }
            }.navigationTitle("Authors")
        }
      
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
