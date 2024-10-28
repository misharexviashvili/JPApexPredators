//
//  PredatorDetail.swift
//  JPApexPredators17
//
//  Created by Misho's Mac on 23.10.24.
//

import SwiftUI

struct PredatorDetail: View {
    let predator: ApexPredator
    var body: some View {
        GeometryReader{geo in
            ScrollView{
                ZStack(alignment: .bottomTrailing){
                    //                Background image
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                        .overlay{
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(
                                        color: .clear,
                                        location: 0.9
                                    ),
                                    Gradient.Stop(
                                        color: .black,
                                        location: 1
                                    )
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        }
                    //                Dino image
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/1.5, height: geo.size.height/3)
                        .scaleEffect(x:-1)
                        .shadow(color:.black ,radius: 7)
                        .offset(y:20)
                }
                VStack(alignment: .leading){
                    //            Dino name
                    Text(predator.name)
                        .font(.largeTitle)
                    //            Current location
                    
                    //            Appears in
                    Text("Appears in:")
                        .font(.title3)
                    ForEach(predator.movies, id: \.self){
                        movie in
                        Text("• \(movie)")
                            .font(.subheadline)
                        
                    }
                    //            Movie scenes
                   Text("Movie moments")
                        .font(.title)
                        .padding(15)
                    ForEach(predator.movieScenes){
                        scene in
                        Text(scene.movie)
                            .font(.title2)
                            .padding(.vertical, 1)
                        Text(scene.sceneDescription)
                            .padding(.bottom, 15)
                    }
                   
                    //            Link
                    Text("Read more:")
                        .font(.caption)
                    Link(predator.link, destination: URL(string: predator.link)!)
                        .font(.caption)
                        .foregroundStyle(.blue)
                        
                }
                .padding()
                .padding(.bottom)
                .frame(width: geo.size.width, alignment: .leading)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    PredatorDetail(predator: Predators().apexPredators[10])
        .preferredColorScheme(.dark)
}
