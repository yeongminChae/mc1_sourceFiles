//
//  SwiftUIView.swift
//  
//
//  Created by 채영민 on 2023/03/30.
//

import SwiftUI
import AVFoundation

struct KaleidoscopeScene: View {
    @State private var wholeAnimation: CGFloat = -1200
    @State private var fadeInOut = false
    @State private var fadeInOut2 = false
    @State private var isClicked = false
    @State private var flowAnimation: CGFloat = 0
    @State var page:Bool = true
    
    private var soundManager = AVPlayer(url:URL(string:  "https://migusdn.github.io/Noahs_Ark/Resources/story7_Jumadeung.mp3")!)
    
    var body: some View {
        var _ = soundManager.play()
        ZStack{
            if page{
                GeometryReader { geometry in
                    Image("secne0_wholePage")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .frame(width:750, height: 100)
                        .offset(y: -wholeAnimation)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                withAnimation(Animation.linear(duration: 8.5)) {
                                    self.wholeAnimation = geometry.size.height*3.6
                                }
                            }
                        }
                    
                    Image("secne0_arrorToRight")
                        .onAppear(){
                        withAnimation(Animation
                            .easeInOut(duration: 1)
                            .delay(8)
                        )
                            {fadeInOut.toggle()}
                    }.opacity(fadeInOut ? 1 : 0)
                    .foregroundColor(.white)
                    .offset(x: geometry.size.width/1.05 ,y: geometry.size.height/1.2)
                    .onTapGesture {
                        isClicked = true
                    }
                    
                    if isClicked {
                        Image("secne0_qEmageLast")
                            .resizable()
                            .onAppear(){
                            withAnimation(Animation
                                .easeInOut(duration: 0.2))
                                {fadeInOut.toggle()}
                        }.opacity(fadeInOut ? 1 : 0)
                        .frame(width: 360, height: 360)
                        .offset(x: flowAnimation)
                        .position(x: geometry.size.width/(-4.05) ,y: geometry.size.height/1.7)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                withAnimation(Animation.linear(duration: 0.1)) {
                                    self.flowAnimation = geometry.size.width*2
                                }
                            }
                        }
                    }else {
                        Image("secne0_qEmageLast")
                            .resizable()
                            .onAppear(){
                            withAnimation(Animation
                                .easeInOut(duration: 0.2).delay(8.9))
                                {fadeInOut2.toggle()}
                        }.opacity(fadeInOut2 ? 1 : 0)
                            .frame(width: 360, height: 360)
                            .position(x: geometry.size.width/(-3.8) ,y: geometry.size.height/1.7)
                    }
                }.onTapGesture {
                    page.toggle()
                }
            }else{
                Story8()
            }
        }
    }
}

struct KaleidoscopeScene_Previews: PreviewProvider {
    static var previews: some View {
        KaleidoscopeScene().previewInterfaceOrientation(.landscapeRight)
    }
}
