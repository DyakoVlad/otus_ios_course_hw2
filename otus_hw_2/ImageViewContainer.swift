//
//  ImageViewContainer.swift
//  otus_hw_2
//
//  Created by Vladislav Dyakov on 20.12.2019.
//  Copyright © 2019 Vladislav Dyakov. All rights reserved.
//

import SwiftUI
import UIKit
import Alamofire

struct ImageViewContainer: View {
    @EnvironmentObject private(set) var remoteImageURL: RemoteImageURL
    
    var body: some View {
        Image(uiImage: (remoteImageURL.data.isEmpty ? UIImage(named: "placeholder") : UIImage(data: remoteImageURL.data))!)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 150)
    }
}

class RemoteImageURL: ObservableObject {
    
    @Published var data = Data()
    
    init(imageURL: String) {
        Alamofire.request(imageURL).responseData(queue: .global(qos: .userInitiated)) { response in
            if let data = response.value {
                DispatchQueue.main.async {
                    self.data = data
                }
            }
        }
    }
}
