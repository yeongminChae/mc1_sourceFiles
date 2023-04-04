//
//  Final3.swift
//  MC1NoahArk
//
//  Created by 이승용 on 2023/03/30.
//

import SwiftUI

struct Final3: View {
    @State var page:Bool = true
    var body: some View {
        ZStack{
            if page {
                Image("Final_Background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("2023.03.20 ~ 21")
                        .foregroundColor(.white)
                        .font(.custom("HeirofLightOTFRegular", size: 18))
                        .padding(5)
                    Text("우리의 회고")
                        .foregroundColor(.white)
                        .font(.custom("HeirofLightOTFRegular", size: 30))
                    
                    HStack{
                        VStack{
                            Text("나는 디자인")
                                .opacity(0.7)
                            Image("Final3_DesignQ")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 71)
                        }
                        .foregroundColor(.white)
                        .font(.custom("HeirofLightOTFRegular", size: 16))
                        .padding()
                        VStack{
                            Text("나는 노션")
                                .opacity(0.7)
                            Image("Final3_NotionQ")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 71)
                        }
                        .foregroundColor(.white)
                        .font(.custom("HeirofLightOTFRegular", size: 16))
                        .padding()
                        
                        VStack{
                            Text("나는 정리")
                                .opacity(0.7)
                            Image("Final3_DomainQ")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 71)
                        }
                        .foregroundColor(.white)
                        .font(.custom("HeirofLightOTFRegular", size: 16))
                        .padding()
                    }
                }.padding()
                    .offset(y: -30)
                ZStack{
                    Image("Final_TextBackground")
                        .resizable()
                        .scaledToFit()
                    Text("후반부엔 누구는 디자인, 누구는 노션, 누구는 정리가 분담되며\n다들 점점 소통이 줄고 지쳐갔어요.")
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
                            .foregroundColor(Color.black)
                            .frame(width: 150,height: 100)
                            .position(x:360,y: 130)
                            .opacity(0.0000000001)
                            .onTapGesture {
                                page.toggle()
                            }
                    )
            }else{
                Final4()
            }
        }
    }
}

//struct Final3_Previews: PreviewProvider {
//    static var previews: some View {
//        Final3().previewInterfaceOrientation(.landscapeRight)
//    }
//}
