//
//  NewsWorldAppApp.swift
//  NewsWorldApp
//
//  Created by yusuf bakır on 14.10.2023.
//

import SwiftUI

@main
struct NewsWorldAppApp: App {
   @StateObject  private var  newsViewModel : NewsViewModel = NewsViewModel(service: NetworkManager())

    var body: some Scene {
        WindowGroup {
            HomePage(newsViewModel: newsViewModel)
               
        }
    }
}
