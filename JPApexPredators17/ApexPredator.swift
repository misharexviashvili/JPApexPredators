//
//  ApexPredator.swift
//  JPApexPredators17
//
//  Created by Misho's Mac on 20.10.24.
//

import Foundation

struct ApexPredator : Decodable {
    let id : Int
    let name : String
    let latitude : Double
    let longitude : Double
    let movies : [String]
    let movieScenes : [MovieScene]
    let link : String
    struct MovieScene : Decodable {
        let id : Int
        let movie : String
        let sceneDescription: String
    }
}
