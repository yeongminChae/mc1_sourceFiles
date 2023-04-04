import SwiftUI
import AVFoundation


struct Quiz1View: View {
    var defalutTimeRemaining: CGFloat = 10
    var linewith: CGFloat = 5
    var radius: CGFloat = 7
    
    @State var isBlur = true
    @State var isAnimating: Bool = false
    @State var isShow = false
    @State var ringBell = false
    @State var turn = false
    @State private var angle:Double = -15
    @State private var isActive = false
    @State private var TimeRemaining: CGFloat = 10
    @State private var fadeInOut = false
    @State private var isAnswerOn = true
    
    private var soundManager = AVPlayer(url:URL(string:  "https://migusdn.github.io/Noahs_Ark/Resources/Game_WhileQuizSolving.mp3")!)
    private var soundManager1 = AVPlayer(url:URL(string:  "https://migusdn.github.io/Noahs_Ark/Resources/game_timeout.mp3")!)
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let ringTimer = Timer.publish(every: 0.013, on: .main, in: .common).autoconnect()
    
    
    
    var body: some View {
        var _ = soundManager1.volume=3
        var _ = soundManager.volume=0.2
        ZStack {
            if isAnswerOn  {
                
                ZStack {
                    
                    Image("Quiz_Background")
                        .resizable()
                        .ignoresSafeArea(.all)
                    
                    
                    VStack { // 질문
                        HStack (spacing: 70) {
                            
                            Image("Quiz1_Step1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150)
                                .position(x: 60, y: 65)
                            
                            Image("Quiz1_Q")//문제사진
                                .resizable()
                                .scaledToFit()
                                .frame(width: 400, height: 150)
                                .position(x:140, y: 65)
                            
                            
                            VStack (spacing: 25) {
                                
                                ZStack {
                                    Circle()
                                        .stroke(Color.gray.opacity(0.2), style: StrokeStyle(lineWidth: linewith, lineCap: .round))
                                        .frame(width: 50, height: 50)
                                    
                                    
                                    Circle()
                                        .trim(from: 0, to: 1 - ((defalutTimeRemaining - TimeRemaining) / defalutTimeRemaining))
                                        .stroke(TimeRemaining > 5 ? Color.green : TimeRemaining > 2 ? Color.yellow : Color.red, style: StrokeStyle(lineWidth: linewith, lineCap: .round))
                                        .rotationEffect(.degrees(-90))
                                        .animation(.easeInOut(duration: 1), value: isAnimating)
                                        .frame(width: 50, height: 50)
                                    
                                    
                                    if TimeRemaining > 0{
                                        Text("\(Int(TimeRemaining))")
                                            .font(.title)
                                    }else{
                                        var _ = soundManager.pause()
                                        Image(systemName:"bell.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 25, height: 25)
                                            .rotationEffect(.degrees(angle),anchor: .top)
                                            .onReceive(ringTimer){ _ in
                                                
                                                if angle > 30{
                                                    turn.toggle()
                                                }else if angle < -15{
                                                    turn.toggle()
                                                }
                                                if turn{
                                                    angle -= 1
                                                }else{
                                                    angle += 1
                                                }
                                            }
                                        
                                    }
                                    
                                    
                                }
                                .frame(width: radius * 2, height: radius * 2)
                                .position(x:170, y: 65)
                                
                            }//동그라미와 텍스트 간격 vstack
                            
                            .onReceive(timer, perform: { _ in
                                if isActive{
                                    
                                    
                                    if TimeRemaining < 1 {
                                        //            TimeRemaining = defalutTimeRemaining
                                        isShow = true
                                    } else {
                                        TimeRemaining -= 1
                                    }}
                            })
                            
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        HStack {
                            
                            
                            Button(action: {print("Button0")}){
                                Image("Quiz1_QImage")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 550, height: 270)
                                    .position(x:170,y:50)
                                    .onTapGesture{
                                        var _ = soundManager.play()
                                        isActive.toggle()
                                        
                                        
                                    }
                                //
                                
                            }
                            
                            //이렇게 하면 전체적으로 움직인다 옆에 padding조절
                            
                            VStack {
                                
                                if isBlur{
                                    Button(action: {print("Button1")
                                        
                                    }){
                                        Image("Quiz1_A")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 500, height: 60)
                                            .padding(10)
                                        
                                    }
                                    
                                    Button(action: {print("Button2")
                                        isBlur=false
                                    }){
                                        Image("Quiz1_B")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 500, height: 60)
                                            .padding(10)
                                    }
                                    
                                    Button(action: {print("Button3")}){
                                        Image("Quiz1_C")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 500, height: 60)
                                            .padding(10)
                                    }
                                }else{
                                    Button(action: {print("Button1")}){
                                        Image("Quiz1_Ades")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 500, height: 60)
                                            .padding(10)
                                        
                                        
                                    }
                                    
                                    Button(action: {print("Button2")}){
                                        Image("Quiz1_Bans")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 500, height: 60)
                                            .padding(10)
                                    }
                                    
                                    Button(action: {print("Button3")}){
                                        Image("Quiz1_Cdes")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 500, height: 60)
                                            .padding(10)
                                    }
                                }
                                
                                
                                
                                
                            }
                            .position(x:200,y:50)
                            //                    .padding([.top, .leading], 40.0)
                            
                            
                        }//hstack
                        
                    }//vstack
                    if TimeRemaining == 0 {
                        ZStack {
                            
                            var _ = soundManager1.play()
                            Rectangle()
                                .opacity(0.7)
                                .edgesIgnoringSafeArea(.all)
                                .onAppear() {
                                    withAnimation(Animation.easeInOut(duration: 0.6)
                                        .repeatCount(2)) {
                                            fadeInOut.toggle()
                                        }
                                    
                                    
                                }.opacity(fadeInOut ? 1 : 0)
                            
                            
                                Button(action: {print("TimeOver")
                                    isAnswerOn=false
                                }){
                                    Image("Quiz_TimesUpImage")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 600, height: 450)
                                        .opacity(fadeInOut ? 1 : 0)
                                        .position(x: 380, y:190)
                                        
                                }
                                
                                
                               
                                
                           
                            
                            
                        }
                        
                    }
                    
                    
                    
                    
                    
                }//Zstack
            } else {
                Quiz1AnsView()
            }
        }
    }
    
}

struct Quiz1View_Previews: PreviewProvider {
    static var previews: some View {
        Quiz1View()
            .previewInterfaceOrientation(.landscapeRight)
    }
}


