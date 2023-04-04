//
//  Story5.swift
//
//
//  Created by HyunwooPark on 2023/03/29.
//

import SwiftUI
import AVFoundation

struct Story7: View {
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
    @State private var qX:CGFloat=400
    @State private var qY:CGFloat=5
    @State private var delayT:Int = 0
    //76
    
    let timer = Timer.publish(every:0.013, on:.main, in:.common).autoconnect()
    
    private var soundManager = AVPlayer(url:URL(string:  "https://migusdn.github.io/Noahs_Ark/Resources/story6_WildTeam.mp3")!)
    
    var body: some View {
        var _ = soundManager.play()
        ZStack{
            if delayT<190{
                VStack{
                    
                    Image("Story5_background")
                        .resizable()
                        .ignoresSafeArea()
                        .scaledToFill()
                }
                
                VStack{
                    Image("Story5_rainbow")
                        .resizable()
                        .ignoresSafeArea()
                    //                    .frame(width: 1000,height: 100)
                        .scaledToFill()
                        .position(x:380,y: 200)
                    
                }
                
                VStack{
                    Image("Story5_q").resizable()
                        .resizable()
                        .frame(width: 100, height: 100)
                    //                        .offset(x: flowAnimation)
                        .scaleEffect(scale, anchor: UnitPoint(x:0.71,y:0.65))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                withAnimation(Animation.easeInOut(duration: 0.5)) {
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
                            if(qX+260>20){
                                qX -= 2.3
                                qY += 0.75
                            }else{
                                delayT += 1
                            }
                            
                        }
                }
                
                VStack{
                    Image("Story7_animals")
                        .resizable()
                        .frame(width: 200,height: 150)
                        .position(x:150,y:300)
                }
                VStack{
                    Image("Story7_text")
                        .resizable()
                        .frame(width: 900,height: 70)
                        .position(x:392,y:340)
                }
            }else{
                KaleidoscopeScene()
                var _ = soundManager.pause()
            }
            
        }
    }
}

//struct Story7_Previews: PreviewProvider {
//    static var previews: some View {
//        Story7().previewInterfaceOrientation(.landscapeRight)
//    }
//}
