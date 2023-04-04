//
//  Final6.swift
//  MC1NoahArk
//
//  Created by 이승용 on 2023/03/30.
//

import SwiftUI

struct Final6: View {
    @State var page:Bool = true
    var body: some View {
        ZStack{
            if page {
                Image("Final_Background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("2023.03.23 ~ 30")
                        .foregroundColor(.white)
                        .font(.custom("HeirofLightOTFRegular", size: 18))
                        .padding(5)
                    Text("우리의 회고")
                        .foregroundColor(.white)
                        .font(.custom("HeirofLightOTFRegular", size: 30))
                    Image("Final_GroupOfQ")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 371)
                        .padding()
                }.padding()
                    .offset(y: -30)
                ZStack{
                    Image("Final_TextBackground")
                        .resizable()
                        .scaledToFit()
                    Text("그래서 우리는 이번에 다같이 기획하고, 다같이 디자인하고\n함께 즐기며 프로젝트를 하기로 마음을 먹었답니다.")
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
                Final7()
            }
        }
    }
}

//struct Final6_Previews: PreviewProvider {
//    static var previews: some View {
//        Final6().previewInterfaceOrientation(.landscapeRight)
//    }
//}
