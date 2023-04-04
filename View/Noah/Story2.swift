//
//  Story2.swift
//  
//
//  Created by 이승용 on 2023/03/29.
//

import SwiftUI
import AVFoundation

struct Story2: View {
    @State var page:Bool = true
    private var soundManager = AVPlayer(url:URL(string:  "https://migusdn.github.io/Noahs_Ark/Resources/story1_MaskOn.mp3")!)
    private var soundManager2 = AVPlayer(url:URL(string:  "https://migusdn.github.io/Noahs_Ark/Resources/story2~3_Woongsung.mp3")!)
    var body: some View {
        var _ = soundManager2.volume = 0.05
        var _ = soundManager.play()
        var _ = soundManager2.play()
        
        
        
        ZStack{
            if page{
                Image("Story2_BackgroundMainLab")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                Image("Story2_BackgroundBlur")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)

                VStack{
                    Image("Story2_2023.03.13")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 16)
                        .padding()
                    Image("Story2_FirstDay")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                    Image("Story2_QWithMask")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 122)
                        .padding()
                }.offset(y:-30)
                
                ZStack{
                    Image("Story2_TextBackground")
                        .resizable()
                        .scaledToFit()
                    Image("Story2_WeWithMask")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 16)
                }.offset(y: 130)
                
                Image("Story2_Arrow")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 28)
                    .offset(x: 350, y: 130)
                    .overlay(
                        Rectangle()
                            .foregroundColor(Color.black)
                            .frame(width: 150,height: 100)
                            .position(x:360,y: 130)
                            .opacity(0.0000000001)
                            .onTapGesture {
                                page.toggle()
                            }
                    )
            }else{
                var _ = soundManager.pause()
                var _ = soundManager2.pause()
                Story3()
                
//                soundManager.
                
            }
        }
    }
}

struct Story2_Previews: PreviewProvider {
    static var previews: some View {
        Story2().previewInterfaceOrientation(.landscapeRight)
    }
}
