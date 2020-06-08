//
//  FirstView.swift
//  SwiftUI-PopBack
//
//  Created by Alexander Matrosov on 08.06.2020.
//  Copyright © 2020 СomeOnSoftware. All rights reserved.
//

import SwiftUI

struct FirstView: View {
    
    
    @EnvironmentObject var simpleService: SimpleService
    
    @State var showSecondView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Button(action: {
                    self.downloadImageFromURL()
                }) {
                    Text("Next")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding(EdgeInsets(top: 20, leading: 40, bottom: 20, trailing: 40))
                        .background(Color.blue)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
                
                NavigationLink(destination: SecondView(), isActive: $showSecondView) { EmptyView() }
            }
        }
    }
    
    func downloadImageFromURL() {
        if let url = URL(string: "https://placebear.com/200/300") {
            simpleService.downloadImage(from: url) { (image) in
                self.showSecondView = true
            }
        }
    }
}
