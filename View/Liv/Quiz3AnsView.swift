//
//  SwiftUIView.swift
//
//
//  Created by 김규리 on 2023/03/30.
//

import SwiftUI
import AVFoundation

struct Quiz3AnsView: View {
    var linewith: CGFloat = 5
    var radius: CGFloat = 7
    
    @State private var isArrowOn = true
    private var soundManager = AVPlayer(url:URL(string:  "https://migusdn.github.io/Noahs_Ark/Resources/Game_QuizAnswerSound.mp3")!)
    
    var body: some View {
        var _ = soundManager.play()
        ZStack {
            if isArrowOn  {
                
                ZStack {
                    
                    Image("Quiz_Background")
                        .resizable()
                        .ignoresSafeArea(.all)
                    
                    
                    
                    
                    VStack { // 질문
                        HStack (spacing: 70) {
                            Image("Quiz3_Step3")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150)
                                .position(x: 60, y: 65)
                            
                            Image("Quiz_정답은!")//문제사진
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 150)
                                .position(x: 300, y: 65)
                            
                            Button(action: {print("NextButton")}) {
                                Image("Story2_Arrow")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 28)
                                    .position(x: 200, y: 65)
                                    .contrast(0.2)
                                    .onTapGesture {
                                        isArrowOn.toggle()
                                    }
                            }
                        }
                    }
                    
                    HStack {
                        
                        Image("Quiz3_AImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 550, height: 270)
                            .position(x:170,y:240)
                        
                        
                        
                        
                        VStack{
                            Button(action: {print("Button1")}){
                                Image("Quiz3_Aans")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 500, height: 60)
                                    .padding(10)
                                
                                
                            }
                            
                            Button(action: {print("Button2")}){
                                Image("Quiz3_Bdes")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 500, height: 60)
                                    .padding(10)
                            }
                            
                            Button(action: {print("Button3")}){
                                Image("Quiz3_Cdes")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 500, height: 60)
                                    .padding(10)
                            }
                            
                        }
                        .position(x:200,y:240)
                        
                    }
                    
                    
                }
            } else {
                Quiz4View()
            }
        }
    }
}

//struct Quiz3AnsView_Previews: PreviewProvider {
//    static var previews: some View {
//        Quiz3AnsView()
//            .previewInterfaceOrientation(.landscapeRight)
//
//    }
//}
//
