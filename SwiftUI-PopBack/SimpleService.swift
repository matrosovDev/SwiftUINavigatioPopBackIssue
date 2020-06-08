//
//  SomeService.swift
//  SwiftUI-PopBack
//
//  Created by Alexander Matrosov on 08.06.2020.
//  Copyright © 2020 СomeOnSoftware. All rights reserved.
//

import SwiftUI

class SimpleService: ObservableObject {
    
    @Published var image: Image?
    
    typealias SimpeServiceResponse = (Image?, NSError?) -> Void
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL, completion: @escaping (Image?) -> Void) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { [weak self] in
                if let uiImage = UIImage(data: data) {
                    self?.image = Image(uiImage: uiImage)
                    completion(self?.image)
                }
            }
        }
    }
}
