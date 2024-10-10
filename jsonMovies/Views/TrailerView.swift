//
//  TrailerView.swift
//  JsonMovies
//
//  Created by Jorge Maldonado Borbón on 06/09/22.
//

import SwiftUI
import WebKit
struct TrailerView: View {
    
    @StateObject var movies : MoviesViewModel
    
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VideoView(videoID: movies.key)
                .frame(minHeight: 0, maxHeight: UIScreen.main.bounds.height * 0.3 )
                .cornerRadius(12)
                .padding(.all)
                .task {
                    await movies.fetchVideo()
                }
        }
    }
}

struct VideoView: UIViewRepresentable {
    
    let videoID : String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: "https://www.youtube.com/embed/\(videoID)") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url:url))
    }
    
}



