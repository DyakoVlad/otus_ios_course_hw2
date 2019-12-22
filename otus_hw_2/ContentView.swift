//
//  ContentView.swift
//  otus_hw_2
//
//  Created by Vladislav Dyakov on 16.12.2019.
//  Copyright © 2019 Vladislav Dyakov. All rights reserved.
//

import SwiftUI
import UIKit
import Alamofire
import SwiftyJSON

final class CharacterListViewModel: ObservableObject {
    @Published private(set) var characters: [ModelCharacter] = []
    @Published var isNewPageLoading: Bool = false
    @Published var names = ["Rick", "Morty", "Summer"]
    @Published var currentCharacter = 0 {
        didSet {
            loadCharacters()
        }
    }
    
    init() {
        loadCharacters()
    }
    
    func loadCharacters() {
        guard isNewPageLoading == false else {
            return
        }
        isNewPageLoading = true
        CharactersAPI.getAllCharacters(name: names[currentCharacter]) { characters, error in
            if self.characters.last?.name?.contains(self.names[self.currentCharacter]) ?? false {
                self.characters.append(contentsOf: characters?.results ?? [])
            } else {
                self.characters = characters?.results ?? []
            }
            self.isNewPageLoading = false
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var characterListViewModel: CharacterListViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Options", selection: $characterListViewModel.currentCharacter) {
                    ForEach(0 ..< characterListViewModel.names.count) { index in
                        Text(self.characterListViewModel.names[index])
                            .tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                List(characterListViewModel.characters) { character in
                    VStack(alignment: .leading) {
                        HStack {
                            ImageViewContainer()
                                .environmentObject(RemoteImageURL(imageURL: character.image!))
                            VStack(alignment: .leading) {
                                Text(character.name!)
                                    .font(.system(.headline))
                                    .fontWeight(.heavy)
                                Text(character.species!)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Rick and Morty")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CharacterListViewModel())
    }
}
