//
//  Home.swift
//  JsonMovies
//
//  Created by Jorge Maldonado Borbón on 06/09/22.
//

import SwiftUI

struct Home: View {
    
    @State private var search = ""
    @State private var searchButton = false
        
    var body: some View {
        NavigationStack{
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.white, .purple, .blue]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                VStack{
                    TextField("Search", text: $search)
                        .textFieldStyle(.roundedBorder)
                        .padding(.top, 15)
                        .padding(.bottom, 20)
                        .onAppear{
                            search = ""
                        }
                    
                    Button {
                        searchButton.toggle()
                    } label: {
                        Text("Search Movie")
                            .font(.title2)
                            .bold()
                    }
                    .buttonStyle(.bordered)
                    .tint(.white)
                    Spacer()
                    
                        .navigationDestination(isPresented: $searchButton) {
                        MoviesView(movie: search)
                    }
                    
                }.padding(.all)
                    .navigationBarTitle("App Movie Search")
            }
        }
    }
}

