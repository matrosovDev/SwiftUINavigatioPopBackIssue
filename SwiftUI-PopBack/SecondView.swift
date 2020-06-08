//
//  SecondView.swift
//  SwiftUI-PopBack
//
//  Created by Alexander Matrosov on 08.06.2020.
//  Copyright © 2020 СomeOnSoftware. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        image
            .resizable()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
            .aspectRatio(contentMode: .fill)
    }
}

struct SecondView: View {
    
    @EnvironmentObject var simpleService: SimpleService
    
    var body: some View {
        NavigationView {
            CircleImage(image: simpleService.image!)
                .frame(height: 140)
                .frame(width: 140)
        }.onAppear(perform: fetch)
    }
    
    private func fetch() {
        print(Date())
    }
}
