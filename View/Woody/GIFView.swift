//
//  SwiftUIView.swift
//  
//
//  Created by HyunwooPark on 2023/03/29.
//

import SwiftUI
import SwiftUIGIF

struct GIFImageTest: View {
    @State private var imageData: Data? = nil
    
    var body: some View {
        ZStack{
            VStack {
                GIFImage(name: "Times Up") // load from assets
                    .frame(height: 00)
                if let data = imageData {
                    GIFImage(data: data) // load from data
                        .frame(width: 300)
                        .opacity(1)
                } else {
                    Text("Loading...")
                        .onAppear(perform: loadData)
                }
            }
            VStack{
                Text("담배?")
                Image("Quiz1_Step1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .position(x: 60, y: 65)
            }
            
        }
    }
    
    private func loadData() {
        let task = URLSession.shared.dataTask(with: URL(string: "https://user-images.githubusercontent.com/129173717/228770056-f819bd1b-7a08-4a55-878a-3ae9f1d4b62f.gif")!) { data, response, error in
            imageData = data
        }
        task.resume()
    }
}
struct Previews: PreviewProvider {
    static var previews: some View {
        GIFImageTest().previewInterfaceOrientation(.landscapeRight)
    }
}
