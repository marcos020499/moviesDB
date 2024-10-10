//  Created by Marcos Manzo.
//

import Foundation

struct Movies: Codable {
    let page: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable, Identifiable {
    let id: Int
    let original_title : String
    let poster_path : String?
    let overview : String
}


struct videoModel: Codable {
    let id: Int
    let results: [videoResult]
}


struct videoResult: Codable{
    let key : String
    let type : String
}


