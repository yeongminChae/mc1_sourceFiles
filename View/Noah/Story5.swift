//
//  Story5.swift
//
//
//  Created by HyunwooPark on 2023/03/29.
//

import SwiftUI
import AVFoundation

struct Story5: View {
    let a: CGFloat = 1200
    let b: CGFloat = 500
    @State var moveAlongCircularPath = false;
    @State private var angle: Double = 180
    @State private var rain: Double = 0
    @State private var rainX:CGFloat = 820
    @State private var rainY:CGFloat = -120
    @State private var ellipseX: CGFloat = .zero
    @State private var ellipseY: CGFloat = .zero
    @State private var isShow = true
    @State private var completeSun = false
    @State private var completeRainbow = false
    @State private var completePage = false
    @State private var scale = 0.0
    @State private var rotate = 0.0
    @State private var flowAnimation: CGFloat = 0
    @State private var qX:CGFloat=320
    @State private var qY:CGFloat=5
    @State private var page:Bool = true
    
    let timer = Timer.publish(every:0.013, on:.main, in:.common).autoconnect()
    private var soundManager = AVPlayer(url:URL(string:  "https://migusdn.github.io/Noahs_Ark/Resources/story4_BirdSound.mp3")!)
    private var soundManager1 = AVPlayer(url:URL(string:  "https://migusdn.github.io/Noahs_Ark/Resources/story4_InTeamMember'sMind.mp3")!)
    private var soundManager2 = AVPlayer(url:URL(string:  "https://migusdn.github.io/Noahs_Ark/Resources/story5_Shaaaaaaa.mp3")!)

    var body: some View {
        var _ = soundManager.volume = 0.2
        var _ = soundManager.play()
        var _ = soundManager1.play()
        //8 2 6 6
        ZStack{
            if page {
                VStack{
                    
                    Image("Story5_background")
                        .resizable()
                        .ignoresSafeArea()
                        .scaledToFill()
                }
                if completeSun{
                    var _ = soundManager2.play()
                    VStack{
                        Image("Story5_rainbow")
                            .resizable()
                            .ignoresSafeArea()
                        //                    .frame(width: 1000,height: 100)
                            .scaledToFill()
                            .offset(x:rainX,y: rainY)
                            .onReceive(timer){ _ in
                                if(rainX+4>4){
                                    rainX -= 12
                                    rainY += 1.76
                                }else{
                                    completeRainbow.toggle()
                                }
                            }
                    }
                    .animation(.easeIn(duration: 0.5))
                }
                VStack{
                    GeometryReader{ geometry in
                        
                        Ellipse()
                            .frame(width: a,height: b)
                            .position(x:550,y:350).opacity(0)
                            .overlay(
                                Image("Story5_sun").resizable().frame(width: 117,height: 194, alignment: .leading).scaledToFit()
                                    .rotationEffect(Angle(degrees: 80.8))
                                    .rotationEffect(
                                        .degrees(angle))
                                    .offset(x: ellipseX, y: ellipseY)
                                
                            )
                            .onReceive(timer){ _ in
                                if angle<287 {
                                    angle += 2
                                    let theta = CGFloat(.pi * angle / 180)
                                    ellipseX = a / 2 * cos(theta)+200
                                    ellipseY = b / 2 * sin(theta)+180
                                    
                                }else{
                                    completeSun = true
                                    //                                    playSound(sound: "GameBGM", type: "mp3")
                                }
                            }
                        
                    }
                }
                VStack{
                }
                
                VStack{
                    Image("Story5_q").resizable()
                        .resizable()
                        .frame(width: 100, height: 100)
                    //                        .offset(x: flowAnimation)
                        .scaleEffect(scale, anchor: UnitPoint(x:0.71,y:0.65))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                withAnimation(Animation.easeInOut(duration: 0.5).delay(2)) {
                                    self.scale = 1.2
                                }
                            }
                        }
                        .rotationEffect(.degrees(rotate))
                        .onAppear {
                            withAnimation(.linear(duration: 0.3)
                                .speed(0.3).repeatForever(autoreverses: false)) {
                                    self.rotate = 360.0
                                }
                        }
                        .offset(x:qX,y:qY)
                        .onReceive(timer){ _ in
                            if completeRainbow{
                                if(qX+260>20){
                                    qX -= 2.3
                                    qY += 0.75
                                } else{
                                    page.toggle()
                                }
                            }
                        }
                    
                }
                VStack{
                    Image("Story5_text")
                        .resizable()
                        .frame(width: 900,height: 70)
                        .position(x:392,y:340)
                    
                }
            } else{
                var _ = soundManager.pause()
                var _ = soundManager1.pause()
                Story6()
                
                
            }
        }
    }
}

struct Story5_Previews: PreviewProvider {
    static var previews: some View {
        Story5().previewInterfaceOrientation(.landscapeRight)
    }
}
