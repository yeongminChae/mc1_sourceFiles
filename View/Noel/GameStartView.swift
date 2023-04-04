//
//  GameStart.swift
//  MC1NoahArk
//
//  Created by 채영민 on 2023/03/28.
//

// .font(.custom("폰트이름", size: int))

import SwiftUI
import AVFoundation

public func imageView(imageName: String, imageSize: CGSize, positionX: CGFloat, positionY: CGFloat) -> some View {
    ZStack {
        Image(imageName)
            .resizable()
            .frame(width: imageSize.width, height: imageSize.height)
            .position(x: positionX, y: positionY)
    }
}

struct GameStartView: View {
    let leeSunJaeSize = CGSize(width: 230, height: 306)
    let iAmFunnySize = CGSize(width: 169, height: 98)
    let reQFontSize = CGSize(width: 101, height: 22)
    let qImageSize = CGSize(width: 279, height: 279)
    let gameTitleSize = CGSize(width: 475, height: 212)
    let typoSize = CGSize(width: 165, height: 100)
    let teammatesSize = CGSize(width: 517, height: 272)
    let noahSize = CGSize(width: 150, height: 310)
    let gameStartBtnSize = CGSize(width: 256, height: 118)
    let typoAnimationSize = CGSize(width: 462, height: 19)
    
    @State private var isClicked:Bool = false
    @State private var noahAni:Bool = false
    @State private var scale = 1.0
    @State private var rotate = 0.0
    @State private var flowAnimation: CGFloat = 0
    @State private var leeSunJaeAnimation: CGFloat = 0
    @State private var leftCutton: CGFloat = 0
    @State private var rightCutton: CGFloat = 0
    @State var page:Bool = true
    
    private var soundManager = AVPlayer(url:URL(string:  "https://migusdn.github.io/Noahs_Ark/Resources/Game_OurSignoel.mp3")!)
    private var soundManager1 = AVPlayer(url:URL(string:  "https://migusdn.github.io/Noahs_Ark/Resources/Game_ClickSound.mp3")!)
    
    var body: some View {
        var _ = soundManager.volume = 2
        var _ = soundManager.play()
        ZStack {
            if page{
                Image("scene1_backgroundWithout") // background
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                //                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                GeometryReader { geometry in
                    imageView(imageName: "scene1_leeSunJae", imageSize: leeSunJaeSize, positionX: geometry.size.width/15, positionY: geometry.size.height/1.55)
                        .offset(x: leeSunJaeAnimation)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: true)) {
                                    self.leeSunJaeAnimation = geometry.size.width/10
                                }
                            }
                        }
                    
                    imageView(imageName: "scene1_iAmFunny", imageSize: iAmFunnySize, positionX: geometry.size.width/6.5, positionY: geometry.size.height/1.05)
                    imageView(imageName: "scene1_re:QFont", imageSize: reQFontSize, positionX: geometry.size.width/1.14, positionY: geometry.size.height/4).background{
                        VStack() {
                            Image("scene1_QImage")
                                .resizable()
                                .frame(width: 279, height: 279)
                                .rotationEffect(.degrees(rotate))
                                .onAppear {
                                    withAnimation(.linear(duration: 0.3).repeatForever(autoreverses: false)
                                        .speed(0.3)) {
                                            rotate = 360.0
                                        }
                                }
                        }.offset(x:240,y: -40)
                    }
                    imageView(imageName: "scene1_gametitile", imageSize: gameTitleSize, positionX: geometry.size.width/2, positionY: geometry.size.height/3.5)
                    
                    imageView(imageName: "scene1_typo", imageSize: typoSize, positionX: geometry.size.width/1.08, positionY: geometry.size.height/1.55)
                    
                    imageView(imageName: "scene1_teammates", imageSize: teammatesSize, positionX: geometry.size.width/2, positionY: geometry.size.height/1.45)
                    
                    imageView(imageName: "scene1_noah", imageSize: noahSize, positionX: geometry.size.width/2.11, positionY: geometry.size.height/1.55)
                        .scaleEffect(scale, anchor: .center)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                withAnimation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
                                    self.scale = 1.2
                                }
                            }
                        }
                    
                    imageView(imageName: "scene1_gameStartBtn", imageSize: gameStartBtnSize, positionX: isClicked ? geometry.size.width/1.16 : geometry.size.width/1.2, positionY: isClicked ? geometry.size.width/2.4 : geometry.size.height/1.13).scaleEffect(isClicked ? 1.2 : 1.0, anchor: .bottomTrailing)
                        .animation(.easeInOut(duration: 0.2))
                        .onTapGesture {
                            var _ = soundManager1.play()
                            isClicked.toggle()
                            page.toggle()
                        }
//                        .overlay(
//                            Rectangle()
//                                .foregroundColor(Color.black)
//                                .frame(width: 250,height: 100)
//                                .position(x:660,y: 330)
//                                .opacity(0.4000000001)
//                                .onTapGesture {
//
//
//                                }
//                        )
                    
                    imageView(imageName: "scene1_typoAnimation", imageSize: typoAnimationSize, positionX: geometry.size.width/17, positionY: geometry.size.height/18).offset(x: flowAnimation)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                withAnimation(Animation.linear(duration: 2.5).repeatForever(autoreverses:false)) {
                                    self.flowAnimation = geometry.size.width*2
                                }
                            }
                        }
                    HStack{
                        Image("Final_LeftCurtain")
                            .resizable()
                            .edgesIgnoringSafeArea(.all)
                            .padding(-5)
                            .offset(x: leftCutton)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    withAnimation(Animation.linear(duration: 3)) {
                                        self.leftCutton = geometry.size.width/(-1)
                                    }
                                }
                            }
                        Image("Final_RightCurtain")
                            .resizable()
                            .edgesIgnoringSafeArea(.all)
                            .padding(-5)
                            .offset(x: rightCutton)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    withAnimation(Animation.linear(duration: 3)) {
                                        self.rightCutton = geometry.size.width/(1)
                                    }
                                }
                            }
                    }
                }
            }else{
                var _ = soundManager.pause()
                GameExplain()
            }
        }
    }
}

struct GameStartView_Previews: PreviewProvider {
    static var previews: some View {
        GameStartView().previewInterfaceOrientation(.landscapeRight)
    }
}
