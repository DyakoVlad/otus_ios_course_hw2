//
//  ImageViewContainer.swift
//  otus_hw_2
//
//  Created by Vladislav Dyakov on 20.12.2019.
//  Copyright © 2019 Vladislav Dyakov. All rights reserved.
//

import SwiftUI
import UIKit

struct ImageViewContainer: View {
    @EnvironmentObject private(set) var remoteImageURL: RemoteImageURL
    
    var body: some View {
        Image(uiImage: (remoteImageURL.data.isEmpty ? UIImage(named: "placeholder") : UIImage(data: remoteImageURL.data))!)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 136, height: 201)
    }
}

class RemoteImageURL: ObservableObject {
    
    @Published var data = Data()
    
    init(imageURL: String) {
        guard let url = URL(string: imageURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
}
