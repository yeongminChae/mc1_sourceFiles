//
//  Story9.swift
//  MC1NoahArk
//
//  Created by 이승용 on 2023/03/30.
//

import SwiftUI
import SwiftUIGIF
import AVFoundation

struct Story9: View {
    @State private var imageData: Data? = nil
    @State private var page = true
    
    private var soundManager = AVPlayer(url:URL(string:  "https://migusdn.github.io/Noahs_Ark/Resources/story9_YouKnowOurMaskOff.mp3")!)
    
    var body: some View {
        var _ = soundManager.play()
        ZStack{
            if page{
                VStack {
                    GIFImage(name: "PlasmaBall") // load from assets
                        .frame(height: 00)
                    if let data = imageData {
                        GIFImage(data: data) // load from data
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                            .opacity(1)
                    } else {
                        Text("Loading...")
                            .onAppear(perform: loadData)
                    }
                }
                Image("Story9_BackgroundBlur")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.67)
                ZStack{
                    Image("Story3_TextBackground")
                        .resizable()
                        .scaledToFit()
                    Text("여러분은 진정한 저희의 모습을 아시나요?")
                        .foregroundColor(.white)
                        .font(.custom("HeirofLightOTFRegular", size: 16))
                }
                .offset(y: 130)
                Image("Final_Arrow")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 28)
                    .offset(x:350, y: 130)
                    .overlay(
                        Rectangle()
                            .foregroundColor(Color.black)
                            .frame(width: 300,height: 300)
                            .position(x:350, y:130)
                            .opacity(0.0000000001)
                            .onTapGesture {
                                page.toggle()
                            }
                    )
            }else{
                Story10()
                var _ = soundManager.pause()
            }
        }
    }
    
    private func loadData() {
        let task = URLSession.shared.dataTask(with: URL(string: "https://user-images.githubusercontent.com/82193120/228818548-0726a85d-e974-4bd1-93a3-44868d0e7208.gif")!) { data, response, error in
            imageData = data
        }
        task.resume()
    }
}

//struct Story9_Previews: PreviewProvider {
//    static var previews: some View {
//        Story9().previewInterfaceOrientation(.landscapeRight)
//    }
//}
