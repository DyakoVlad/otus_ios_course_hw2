//
//  ContentView.swift
//  otus_hw_2
//
//  Created by Vladislav Dyakov on 16.12.2019.
//  Copyright © 2019 Vladislav Dyakov. All rights reserved.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    @State var loading: Bool = false
    
    var body: some View {
        if loading {
            Text("Loading")
        } else {
            Text("Rick")
        }
    }
    
    func loadCharacters() {
        Alamofire.request("https://rickandmortyapi.com/api/character/2", method: .get) {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
