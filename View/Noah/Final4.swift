//
//  Final4.swift
//  MC1NoahArk
//
//  Created by 이승용 on 2023/03/30.
//

import SwiftUI

struct Final4: View {
    @State var page:Bool = true
    var body: some View {
        ZStack{
            if page {
                Image("Final_Background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("2023.03.22")
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
                    Text("최종적으로 re:Q가 등장했지만 우리는 의문이 들었어요.")
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
                            .foregroundColor(Color.black)
                            .frame(width: 150,height: 100)
                            .position(x:360,y: 130)
                            .opacity(0.0000000001)
                            .onTapGesture {
                                page.toggle()
                            }
                    )
            }else{
                Final5()
            }
        }
    }
}

//struct Final4_Previews: PreviewProvider {
//    static var previews: some View {
//        Final4().previewInterfaceOrientation(.landscapeRight)
//    }
//}
