//
//  SwiftUIView.swift
//
//
//  Created by 채영민 on 2023/03/30.
//

import SwiftUI
import AVFoundation

struct Story12: View {
    @State private var page = true
    @StateObject private var sound = SoundManager()
//    private var soundManager = AVPlayer(url:URL(string:  "https://migusdn.github.io/Noahs_Ark/Resources/story11_LetUsIntroduce.mp3")!)
//
    var body: some View {
//        var _ = soundManager.play()
        ZStack{
            if page {
                HStack{
                    Image("Final_LeftCurtain")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .padding(-5)
                    Image("Final_RightCurtain")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .padding(-5)
                }
                ZStack{
                    Image("Final_TextBackground")
                        .resizable()
                        .scaledToFit()
                    Text("그럼 저희를 소개해드릴게요!")
                        .foregroundColor(.white)
                        .font(.custom("HeirofLightOTFRegular", size: 16))
                }.offset(y: 130)
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
                var _ = sound.stopSound()
                GameStartView()
//                var _ = soundManager.pause()
            }
        }
    }
}

struct Story12_Previews: PreviewProvider {
    static var previews: some View {
        Story12().previewInterfaceOrientation(.landscapeRight)
    }
}
