//
//  Final1.swift
//  MC1NoahArk
//
//  Created by 이승용 on 2023/03/30.
//

import SwiftUI
import AVFoundation

struct Final1: View {
    @State private var page = true
    private var soundManager = AVPlayer(url:URL(string:  "https://migusdn.github.io/Noahs_Ark/Resources/lastsong2.mp3")!)
    var body: some View {
        var _ = soundManager.volume = 2
        var _ = soundManager.play()
        ZStack{
            if page{
                Image("Final_Background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("노아의 방주의 솔직한 팀워크")
                        .foregroundColor(.white)
                        .font(.custom("HeirofLightOTFRegular", size: 18))
                        .padding(5)
                    Text("우리의 회고")
                        .foregroundColor(.white)
                        .font(.custom("HeirofLightOTFRegular", size: 30))
                    Image("Final_Q")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 122)
                        .padding()
                }.padding()
                    .offset(y: -30)
                ZStack{
                    Image("Final_TextBackground")
                        .resizable()
                        .scaledToFit()
                    Text("우리는 첫번째 프로젝트 \"re:Q\"를 하게 되었어요")
                        .foregroundColor(.white)
                        .font(.custom("HeirofLightOTFRegular", size: 18))
                }.offset(y:130)
                Image("Final_Arrow")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 28)
                    .offset(x:350, y: 130)
                    .overlay(
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 14, height: 28)
                            .position(x:350, y:130)
                            .opacity(0.0000000001)
                            .onTapGesture {
                                page.toggle()
                            }
                    )
            }else{
                Final2()
            }
        }
    }
}

struct Final1_Previews: PreviewProvider {
    static var previews: some View {
        Final1().previewInterfaceOrientation(.landscapeRight)
    }
}
