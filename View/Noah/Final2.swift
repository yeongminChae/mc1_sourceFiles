//
//  Final2.swift
//  MC1NoahArk
//
//  Created by 이승용 on 2023/03/30.
//

import SwiftUI

struct Final2: View {
    @State var page:Bool = true
    var body: some View {
        ZStack{
            if page{
                Image("Final_Background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("2023.03.13 ~ 17")
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
                }
                .padding()
                .offset(y: -30)
                
                Text("????????????????????????")
                    .foregroundColor(.white)
                    .font(.custom("HeirofLightOTFRegular", size: 32))
                    .opacity(0.5)
                
                Text("솔직함이 뭐누..?")
                    .foregroundColor(.white)
                    .font(.custom("HeirofLightOTFRegular", size: 16))
                    .opacity(0.5)
                    .offset(x: 120, y: -40)
                    .rotationEffect(.degrees(-12))
                
                ZStack{
                    Image("Final_TextBackground")
                        .resizable()
                        .scaledToFit()
                    Text("처음엔 \'솔직함\'이라는 주제로 철학적으로 다가가며\n어려움을 겪었고,,,")
                        .foregroundColor(.white)
                        .font(.custom("HeirofLightOTFRegular", size: 18))
                        .multilineTextAlignment(.center)
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
                Final3()
            }
        }
    }
}

//struct Final2_Previews: PreviewProvider {
//    static var previews: some View {
//        Final2().previewInterfaceOrientation(.landscapeRight)
//    }
//}
