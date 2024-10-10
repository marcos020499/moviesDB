//  Created by Marcos Manzo.
//

import Foundation

@MainActor
class MoviesViewModel: ObservableObject {
   
    @Published var dataMovies : [Result] = []
    @Published var titulo = ""
    @Published var movieId = 0
    @Published var show = false
    @Published var key = ""

    
    func fetch(movie:String) async {
        do{
            let urlString = "https://api.themoviedb.org/3/search/movie?api_key=82ce65dbec42440f0e3d0f878461ceec&language=en-US&query=\(movie)&page=1&include_adult=false"
            
            guard let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? "") else { return }
            let (data, _) = try await URLSession.shared.data(from: url)
            let json = try JSONDecoder().decode(Movies.self, from: data)
            self.dataMovies = json.results
            print(json.results)
        }catch let error as NSError {
            print("Error en la api: ", error.localizedDescription)
        }
    }
    
    func fetchVideo() async {
        do{
            let urlString = "https://api.themoviedb.org/3/movie/\(movieId)/videos?api_key=82ce65dbec42440f0e3d0f878461ceec&language=en-US"
            
            guard let url = URL(string: urlString) else { return }
            let (data, _) = try await URLSession.shared.data(from: url)
            let json = try JSONDecoder().decode(videoModel.self, from: data)
            let res = json.results.filter({$0.type.contains("Trailer")})
            self.key = res.first?.key ?? ""
            
        }catch let error as NSError {
            print("Error en la api: ", error.localizedDescription)
        }
    }
    
    
    func sendItem(item: Result){
        titulo = item.original_title
        movieId = item.id
        show.toggle()
    }

    
}
