//
//  ApexPredator.swift
//  JPApexPredators
//
//  Created by Credo on 11/23/25.
//

import SwiftUI

struct ApexPredator: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: APType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }

    struct MovieScene: Decodable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
}

enum APType: String, Decodable, CaseIterable, Identifiable {
    case all
    case land
    case air
    case sea

    var id: APType {
        self
    }

    var background: Color {
        switch self {
        case .land:
            .brown
        case .air:
            .teal
        case .sea:
            .blue
        case .all:
            .black
        }
    }

    var icon: String {
        switch self {
        case .land:
            return "square.stack.3d.up.fill"
        case .air:
            return "leaf.fill"
        case .sea:
            return "wind"
        case .all:
            return "drop.fill"
        }
    }
}
