//
//  Final9.swift
//  MC1NoahArk
//
//  Created by 이승용 on 2023/03/30.
//

import SwiftUI

struct Final9: View {
    var body: some View {
        ZStack{
            HStack{
                Image("Final_LeftCurtain")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .padding(-5)
                Image("Final_RightCurtain")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .padding(-5)
            }
            ZStack{
                Image("Final_TextBackground")
                    .resizable()
                    .scaledToFit()
                Text("지금까지 노아의 방주였습니다.")
                    .foregroundColor(.white)
                    .font(.custom("HeirofLightOTFRegular", size: 16))
            }
        }
    }
}

//struct Final9_Previews: PreviewProvider {
//    static var previews: some View {
//        Final9().previewInterfaceOrientation(.landscapeRight)
//    }
//}
