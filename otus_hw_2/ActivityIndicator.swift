//
//  CustomImageFromUrl.swift
//  otus_hw_2
//
//  Created by Vladislav Dyakov on 20.12.2019.
//  Copyright © 2019 Vladislav Dyakov. All rights reserved.
//

import UIKit
import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let v = UIActivityIndicatorView()
        
        return v
    }
    
    func updateUIView(_ activityIndicator: UIActivityIndicatorView, context: Context) {
        activityIndicator.startAnimating()
    }
}
