//
//  DinoCard.swift
//  JPApexPredators17
//
//  Created by Misho's Mac on 22.10.24.
//

import SwiftUI

struct DinoCard: View {
    let dinoImage : String
    let dinoName : String
    let dinoType : String
    let dinoTypeColor : Color
    var body: some View {
        HStack{
            //                Dinosaur image
            Image(dinoImage)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .shadow(color: .white, radius: 1)
            VStack(alignment: .leading){
                //                    name
                Text(dinoName)
                    .fontWeight(.bold)
                //                    type
                Text(dinoType)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 13)
                    .padding(.vertical, 5)
                    .background(dinoTypeColor)
                    .clipShape(.capsule)
            }
        }
    }
}

#Preview {
    DinoCard(dinoImage: "allosaurus", dinoName: "Dino", dinoType: "land", dinoTypeColor: .teal)
}
