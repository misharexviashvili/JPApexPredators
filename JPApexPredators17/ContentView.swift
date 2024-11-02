//
//  ContentView.swift
//  JPApexPredators17
//
//  Created by Misho's Mac on 21.10.24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    let predators = Predators()
    @State var searchText = ""
    @State var alphabetical = false
    @State var currentSelection = PredatorType.all
    var filteredDinos : [ApexPredator] {
        predators.filter(by: currentSelection)
        predators.sort(by: alphabetical)
        return predators.search(for: searchText)
    }
    
    var body: some View {
        NavigationStack{
            List(filteredDinos) { predator in
                NavigationLink{
                    PredatorDetail(predator: predator, position: .camera(
                        MapCamera(
                            centerCoordinate: predator.location,
                            distance: 30000
                        )
                    ))
                    
                } label : {
                    DinoCard(dinoImage: predator.image, dinoName: predator.name, dinoType: predator.type.rawValue.capitalized, dinoTypeColor: predator.type.background)
                }
            }
            .navigationTitle("Apex Predators")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value : searchText)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button {
                        withAnimation{
                            alphabetical.toggle()
                        }
                    } label: {
                        Image(systemName: alphabetical ? "film" : "textformat")
                            .symbolEffect(.bounce, value: alphabetical)
                    }
                }
                ToolbarItem(placement: .topBarTrailing){
                    Menu{
                        Picker("Filter", selection: $currentSelection.animation()){
                            ForEach(PredatorType.allCases){
                                type in
                                Label(type.rawValue.capitalized, systemImage: type.icon)
                            }
                        }
                    } label : {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
//
