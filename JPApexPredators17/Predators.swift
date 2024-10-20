//
//  Predators.swift
//  JPApexPredators17
//
//  Created by Misho's Mac on 21.10.24.
//

import Foundation

class Predators {
    var apexPredators : [ApexPredator] = []
    init () {
        decodeApexPredatorData()
    }
    func decodeApexPredatorData () {
        if let url = Bundle.main.url(forResource: "JPApexPredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPredators = try decoder.decode([ApexPredator].self, from: data)
            } catch {
                print(error)
            }
        }
    }
}
