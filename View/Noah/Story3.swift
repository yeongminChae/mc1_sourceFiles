//
//  Story3.swift
//  MC1NoahArk
//
//  Created by 이승용 on 2023/03/29.
//

import SwiftUI
import AVFoundation

struct Story3: View {
    @State var page:Bool = true
    @State private var fadeInOut0 = false
    @State private var fadeInOut1 = false
    @State private var fadeInOut2 = false
    @State private var fadeInOut3 = false
    @State private var fadeInOut4 = false
    @State private var fadeInOut5 = false
    @State private var fadeInOut6 = false
    
    private var soundManager = AVPlayer(url:URL(string:  "https://migusdn.github.io/Noahs_Ark/Resources/story2_ThunderSound.mp3")!)
    private var soundManager1 = AVPlayer(url:URL(string:  "https://migusdn.github.io/Noahs_Ark/Resources/story2_WeEachother.mp3")!)
    private var soundManager2 = AVPlayer(url:URL(string:  "https://migusdn.github.io/Noahs_Ark/Resources/story2~3_Woongsung.mp3")!)
//    soundManager.volume=0.1
    var body: some View {
        var _ = soundManager.volume = 0.1
        var _ = soundManager2.volume = 0.05
        var _ = soundManager.play()
        var _ = soundManager1.play()
        
        
        var _ = soundManager2.play()
        ZStack{
            if page{
                Image("Story3_Background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    Image("Story3_2023.03.14~22")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 18)
                        .padding(5)
                    Image("Story3_SiriusTalk")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 33)
                    
                    HStack{
                        Image("Story3_LeftQ")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 99)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30))
                        Image("Story3_RightQ")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 99)
                            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0))
                    }
                }.offset(y: -30)
                
                // 제일 먼저 나오게
                Text("솔직함 어쩌구 저쩌구")
                    .foregroundColor(.white)
                    .font(.custom("HeirofLightOTFRegular", size: 18))
                    .offset(x: -200, y:-30)
                    .onAppear(){
                        withAnimation(Animation
                            .easeInOut(duration: 1).delay(0.5)){
                                fadeInOut0.toggle()
                            }
                    }.opacity(fadeInOut0 ? 1 : 0)
                // 2초뒤 나오기
                Text("이거 정말 좋아요!")
                    .foregroundColor(.white)
                    .font(.custom("HeirofLightOTFRegular", size: 18))
                    .offset(x: 200)
                    .onAppear(){
                        withAnimation(Animation
                            .easeInOut(duration: 1).delay(1.5)){
                                fadeInOut1.toggle()
                            }
                    }.opacity(fadeInOut1 ? 1 : 0)
                // 그리고 2초뒤 나머지 다 나오게
                Text("하 이거 주제 실화냐;;")
                    .foregroundColor(.white)
                    .font(.custom("HeirofLightOTFRegular", size: 18))
                    .opacity(0.4)
                    .offset(x:-250, y:20)
                    .onAppear(){
                        withAnimation(Animation
                            .easeInOut(duration: 1).delay(2)){
                                fadeInOut2.toggle()
                            }
                    }.opacity(fadeInOut2 ? 1 : 0)
                Text("저의 진대 중이거든여???")
                    .foregroundColor(.white)
                    .font(.custom("HeirofLightOTFRegular", size: 18))
                    .opacity(0.4)
                    .offset(x: 170, y: -50)
                    .onAppear(){
                        withAnimation(Animation
                            .easeInOut(duration: 1).delay(3)){
                                fadeInOut3.toggle()
                            }
                    }.opacity(fadeInOut3 ? 1 : 0)
                Text("이게 맞나 싶은데\n          일단 진행시켜")
                    .foregroundColor(.white)
                    .font(.custom("HeirofLightOTFRegular", size: 18))
                    .opacity(0.4)
                    .offset(x: 250, y: 60)
                    .onAppear(){
                        withAnimation(Animation
                            .easeInOut(duration: 1).delay(3)){
                                fadeInOut4.toggle()
                            }
                    }.opacity(fadeInOut4 ? 1 : 0)
                
                ZStack{
                    Image("Story3_TextBackground")
                        .resizable()
                        .scaledToFit()
                    Image("Story3_NonTruth")
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
                var _ = soundManager1.pause()
                var _ = soundManager2.pause()
                Story4()
            }
        }
    }
}

struct Story3_Previews: PreviewProvider {
    static var previews: some View {
        Story3().previewInterfaceOrientation(.landscapeRight)
    }
}
