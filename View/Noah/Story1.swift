//
//  Story1.swift
//  MC1NoahArk
//
//  Created by 이승용 on 2023/03/29.
//

import SwiftUI
import CoreGraphics
import AVFoundation

struct Story1: View {
    @State private var fadeInOut = false
    @State private var scale = 1.0
    @State private var sheepAnimation: CGFloat = 8
    @State private var showStory3:Bool = false
    @State private var page = true
    @StateObject private var sound = SoundManager()
    private var soundManager = AVPlayer(url:URL(string:  "https://migusdn.github.io/Noahs_Ark/Resources/story0_noa's_song.mp3")!)
    var body: some View {
        var _ = soundManager.play()
        
            ZStack{
                if page{
                    var _ = sound.audioPlayer?.play()
                    Image("Story1_Sunset")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    GeometryReader { geometry in
                        Image("Story1_GroupOfQ")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 130)
                            .offset(y: sheepAnimation)
                            .position(x: geometry.size.width/2 ,y: geometry.size.height/1.6)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: true)) {
                                        self.sheepAnimation = geometry.size.height/10
                                    }
                                }
                            }
                        Image("Story1_Boat")
                            .resizable()
                            .scaledToFit()
                            .offset(y: sheepAnimation)
                            .position(x: geometry.size.width/2 ,y: geometry.size.height/1.3)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: true)) {
                                        self.sheepAnimation = geometry.size.height/10
                                    }
                                }
                            }
                    }
                    
                    Image("Story1_TextBackground")
                        .resizable()
                        .scaledToFit()
                        .offset(y:120)
                    
                    VStack{
                        Image("Story1_TruthUs")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 389)
                            .padding()
                        
                        Image("Story1_NoahsArk")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 180)
                    }.offset(y:-100)
                    
                    Text("- START -")
                        .onAppear(){
                            withAnimation(Animation
                                .easeInOut(duration: 1)
                                .repeatForever(autoreverses: true)){
                                    fadeInOut.toggle()
                                }
                        }.opacity(fadeInOut ? 0 : 1)
                        .foregroundColor(.white)
                        .offset(y: 120)
                        .font(.custom("HeirofLightOTFRegular", fixedSize: 16))
                        .overlay(
                            Rectangle()
                                .foregroundColor(Color.black)
                                .frame(width: 300,height: 300)
                                .opacity(0.0000000001)
                                .onTapGesture {
                                    page.toggle()
                                }
                        )
                } else {
                    var _ = soundManager.pause()
                    Story2()
//                    soundManager.stopSound()
                }
            }.onAppear{
                for family: String in UIFont.familyNames {
                    print(family)
                    
                    for names : String in UIFont.fontNames(forFamilyName : family) {
                        print("===\(names)")
                    }
                }
            }
        
    }
}

//struct Story1_Previews: PreviewProvider {
//    static var previews: some View {
//        Story1().previewInterfaceOrientation(.landscapeRight)
//    }
//}
