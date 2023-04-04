//
//  Story11.swift
//  MC1NoahArk
//
//  Created by 이승용 on 2023/03/30.
//

import SwiftUI
import SwiftUIGIF
import AVFoundation

struct Story11: View {
    @State private var imageData: Data? = nil
    @State private var page = true
    @State private var isClicked = false
    @State private var leftCutton: CGFloat = -380
    @State private var rightCutton: CGFloat = 380
    @State private var animationFinished = false
    
    
    
    let timer = Timer.publish(every:0.013, on:.main, in:.common).autoconnect()
    
    private var soundManager = AVPlayer(url:URL(string:  "https://migusdn.github.io/Noahs_Ark/Resources/story11_LetUsIntroduce.mp3")!)
    
    var body: some View {
        var _ = soundManager.play()
        ZStack{
            if page {
                VStack {
                    GIFImage(name: "PlasmaBall")
                        .frame(height: 00)
                    if let data = imageData {
                        GIFImage(data: data)
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                            .opacity(1)
                    } else {
                        Text("Loading...")
                            .onAppear(perform: loadData)
                    }
                }
                Image("Story9_BackgroundBlur")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.67)
                
                GeometryReader {geometry in
                    HStack{
                        Image("Final_LeftCurtain2")
                            .resizable()
                            .edgesIgnoringSafeArea(.all)
                            .padding(-5)
                            .offset(x: leftCutton)
                        Image("Final_RightCurtain2")
                            .resizable()
                            .edgesIgnoringSafeArea(.all)
                            .padding(-5)
                            .offset(x: rightCutton)
                    }
                }
                
                GeometryReader {geometry in
                    if isClicked {
                        HStack{
                            Image("Final_LeftCurtain2")
                                .resizable()
                                .edgesIgnoringSafeArea(.all)
                                .padding(-5)
                                .offset(x: leftCutton)
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                        withAnimation(Animation.linear(duration: 2)) {
                                            self.leftCutton = 0
                                        }
                                    }
                                }
                            Image("Final_RightCurtain2")
                                .resizable()
                                .edgesIgnoringSafeArea(.all)
                                .padding(-5)
                                .offset(x: rightCutton)
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                        withAnimation(Animation.linear(duration: 2)) {
                                            self.rightCutton = 0
                                        }
                                    }
                                }
                        }.onTapGesture {
                            page.toggle()
                        }
                    }
                }
                ZStack{
                    Image("Story3_TextBackground")
                        .resizable()
                        .scaledToFit()
                    Text("그럼 저희를 소개해드릴게요!")
                        .foregroundColor(.white)
                        .font(.custom("HeirofLightOTFRegular", size: 16))
                }
                .offset(y: 130)
                Image("Final_Arrow")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 28)
                    .offset(x:350, y: 130)
                    .onTapGesture {
                        if(isClicked){
                            page = false
                        }
                        isClicked = true
                        
                    }
            }
            else{
                GameStartView()
            }
        }
    }
    
    private func loadData() {
        let task = URLSession.shared.dataTask(with: URL(string: "https://user-images.githubusercontent.com/82193120/228818548-0726a85d-e974-4bd1-93a3-44868d0e7208.gif")!) { data, response, error in
            imageData = data
        }
        task.resume()
    }
}

struct Story11_Previews: PreviewProvider {
    static var previews: some View {
        Story11().previewInterfaceOrientation(.landscapeRight)
    }
}
