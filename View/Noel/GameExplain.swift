//
//  SwiftUIView.swift
//
//
//  Created by 채영민 on 2023/03/29.
//

import SwiftUI
import AVFoundation

struct GameExplain: View {
    let backgroundSize = CGSize(width: 0, height: 0)
    let noahSize = CGSize(width: 150, height: 310)
    let withoutNoahSize = CGSize(width: 517, height: 272)
    let rainbowBridgeSize = CGSize(width: 700, height: 410)
    let qMotionSize = CGSize(width: 60, height: 60)
    let qMotionOffset = CGSize(width: 415, height: 5)
    let modelSize = CGSize(width: 330, height: 130)
    let modelOffset = CGSize(width: 75, height: 30)
    let noahAppearSize = CGSize(width: 80, height: 20)
    let sentenceSize = CGSize(width: 155, height: 95)
    let sunSize = CGSize(width: 70, height: 100)
    let howToGameSize = CGSize(width: 280, height: 55)
    let rectangleSize = CGSize(width: 230, height: 230)
    let explainGameSize = CGSize(width: 200, height: 175)
    let goBubbleSize = CGSize(width: 80, height: 70)
    
    @State private var isClicked:Bool = false
    @State private var noahAni:Bool = false
    @State private var isGoingDown:Bool = true
    @State private var scale = 1.0
    @State private var rotate = 0.0
    @State private var flowAnimation: CGFloat = 0
    @State private var SunAnimation: CGFloat = 0
    @State var page:Bool = true
    
    private var soundManager = AVPlayer(url:URL(string:  "https://migusdn.github.io/Noahs_Ark/Resources/Game_OurSignoel.mp3")!)
    private var soundManager1 = AVPlayer(url:URL(string:  "https://migusdn.github.io/Noahs_Ark/Resources/Game_ClickSound.mp3")!)
    
    var body: some View {
        var _ = soundManager.play()
        ZStack {
            if page{
                Image("scene2_blurredBackground") // background
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                GeometryReader { geometry in
                    imageView(imageName: "scene2_withoutNoah", imageSize: withoutNoahSize, positionX: geometry.size.width/3.1, positionY: geometry.size.height/1.35)
                    
                    imageView(imageName: "scene2_rainbowBridge", imageSize: rainbowBridgeSize, positionX: geometry.size.width/2.5, positionY: geometry.size.height/1.8)
                    
                    VStack(){
                        Image("scene2_QMotion")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .rotationEffect(.degrees(rotate))
                            .onAppear {
                                withAnimation(.linear(duration: 0.3)
                                    .speed(0.3).repeatForever(autoreverses: false)) {
                                        rotate = 360.0
                                    }
                            }
                    }.offset(x:415,y: 5)
                    Image("scene2_whoIsTheBestModel")
                        .resizable()
                        .frame(width: 330, height: 130)
                        .offset(x:75,y:30)
                        .scaleEffect(scale, anchor: .center)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                                    self.scale = 1.2
                                }
                            }
                        }
                   
                    imageView(imageName: "scene2_Noah", imageSize: noahSize, positionX: geometry.size.width/3.4, positionY: geometry.size.height/1.45)
                    
                    imageView(imageName: "scene2_noahAprear", imageSize: noahAppearSize, positionX: geometry.size.width/3.33, positionY: geometry.size.height/1.1)
                    
                    imageView(imageName: "scene2_sentence'공들였다고'", imageSize: sentenceSize, positionX: geometry.size.width/2, positionY: geometry.size.height/2.3)
                }
                
                GeometryReader { geometry in
                    imageView(imageName: "scene2_rotatedSun", imageSize: sunSize, positionX: geometry.size.width/1.602, positionY: geometry.size.height/2.2)
                        .offset(y: SunAnimation)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: true)) {
                                    self.SunAnimation = geometry.size.height/2.3
                                }
                            }
                        }
                    
                    imageView(imageName: "scene2_howToGame", imageSize: howToGameSize, positionX: geometry.size.width/1.25, positionY: geometry.size.height/5.5)
                    
                    imageView(imageName: "scene2_rectangle", imageSize: rectangleSize, positionX: geometry.size.width/1.24, positionY: geometry.size.height/1.48)
                    
                    imageView(imageName: "scene2_explainGame", imageSize: explainGameSize, positionX: geometry.size.width/1.24, positionY: geometry.size.height/1.45)
                    
                    imageView(imageName: "scene2_goBubble", imageSize: goBubbleSize, positionX: isClicked ? geometry.size.width/1.07 : geometry.size.width/1.08, positionY: isClicked ? geometry.size.height/1.05 : geometry.size.height/1.05).scaleEffect(isClicked ? 1.2 : 1.0, anchor: .bottomTrailing)
                        .animation(.easeInOut(duration: 0.2))
                        .onTapGesture {
                            var _ = soundManager1.play()
                            isClicked.toggle()
                        }.overlay(
                            Rectangle()
                                .foregroundColor(Color.black)
                                .frame(width: 250,height: 100)
                                .position(x:660,y: 330)
                                .opacity(0.0000000001)
                                .onTapGesture {
                                    page.toggle()
                                }
                        )
                }
            }
            else{
                Quiz1View()
                var _ = soundManager.pause()
            }
        }
    }
    
    struct GameExplain_Previews: PreviewProvider {
        static var previews: some View {
            GameExplain().previewInterfaceOrientation(.landscapeRight)
        }
    }
}

