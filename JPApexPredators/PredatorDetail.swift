//
//  PredatorDetail.swift
//  JPApexPredators
//
//  Created by Credo on 11/24/25.
//

import SwiftUI

struct PredatorDetail: View {
    let predator: ApexPredator
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width / 1.5, height: geo.size.height / 3.7)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y: 20)
                }
                VStack(alignment: .leading) {
                    Text(predator.name)
                        .font(.largeTitle)
                    Text("Appears In:")
                        .font(.title3)
                    ForEach(predator.movies, id: \.self){
                        movie in
                        Text("•" + movie)
                            .font(.subheadline)
                    }
                    Text("Movie Moments:")
                        .font(.title)
                        .padding(.top, 15)
                
                }
                .padding()
                .frame(width: geo.size.width, alignment: .leading)
                

            }

        }
        .ignoresSafeArea()
    }
}

#Preview {
    PredatorDetail(predator: Predators().apexPredators[2])
    //        .preferredColorScheme(.dark)
}
