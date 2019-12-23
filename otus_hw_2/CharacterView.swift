//
//  CharacterView.swift
//  otus_hw_2
//
//  Created by Vladislav Dyakov on 22.12.2019.
//  Copyright © 2019 Vladislav Dyakov. All rights reserved.
//

import SwiftUI

struct CharacterView: View {
    var character: ModelCharacter
    
    var body: some View {
        VStack {
            ScrollView {
                GeometryReader { g in
                    if g.frame(in: .global).minY <= 0 {
                        ImageViewContainer()
                            .environmentObject(RemoteImageURL(imageURL: self.character.image!))
                        .aspectRatio(contentMode: .fill)
                        .frame(width: g.size.width, height: g.size.height)
                        .offset(y: g.frame(in: .global).minY/9)
                        .clipped()
                    } else {
                        ImageViewContainer()
                            .environmentObject(RemoteImageURL(imageURL: self.character.image!))
                        .aspectRatio(contentMode: .fill)
                        .frame(width: g.size.width,
                               height: g.size.height + g.frame(in: .global).minY)
                        .clipped()
                        .offset(y: -g.frame(in: .global).minY)
                    }
                }
                .frame(height: 400)
                VStack(alignment: .leading, spacing: 15) {
                    Text(character.name!)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Spacer(minLength: 5)
                    Text("STATUS: \((character.status!))")
                    Divider()
                    Text("GENDER: \(character.gender!)")
                    Divider()
                    Text("LAST LOCATION: \(character.location!.name!)")
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}
