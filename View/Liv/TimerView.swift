import SwiftUI

let defalutTimeRemaining: CGFloat = 15
let linewith: CGFloat = 30
let radius: CGFloat = 70


struct TimerView: View {
    @State var isAnimating: Bool = false
    @State var isShow = false
    @State var ringBell = false
    @State var turn = false
    @State private var angle:Double = -15
    @State private var isActive = false
    @State private var TimeRemaining: CGFloat = defalutTimeRemaining
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let ringTimer = Timer.publish(every: 0.013, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        
        
        
        
        VStack (spacing: 25) {
            
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.2), style: StrokeStyle(lineWidth: linewith, lineCap: .round))
                
                Circle()
                    .trim(from: 0, to: 1 - ((defalutTimeRemaining - TimeRemaining) / defalutTimeRemaining))
                    .stroke(TimeRemaining > 10 ? Color.green : TimeRemaining > 5 ? Color.yellow : Color.red, style: StrokeStyle(lineWidth: linewith, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut(duration: 1), value: isAnimating)
                if TimeRemaining>0{
                    Text("\(Int(TimeRemaining))")
                        .font(.largeTitle)
                }else{
                    Image(systemName:"bell.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .rotationEffect(.degrees(angle),anchor: .top)
                        .onReceive(ringTimer){ _ in
                            
                            if angle>30{
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
            
            //            HStack(spacing: 25){
            //                HStack() {
            //                    Image(systemName: "play.fill")
            //                        .frame(width: 25)
            //                        .foregroundColor(.red)
            //                        .font(.title)
            //                        .onTapGesture(perform: {
            //                        })
            //                    //                    .overlay(
            //                    //                        Image(systemName: "Play.fill")
            //                    //                        )
            //                    Text("Play")
            //                        .font(.title)
            //
            //                }
            //
            //                HStack {
            //                    Image(systemName: "backward.fill")
            //                        .foregroundColor(.black)
            //                        .font(.title)
            //                        .onTapGesture(perform: {
            //
            //                        })
            //                    Text("Resume")
            //                        .font(.title)
            //                }
            //
            //
            //
            //            }//글자 두 개 간격 hstack
        }//동그라미와 텍스트 간격 vstack
        
        .onReceive(timer, perform: { value in if TimeRemaining < 1 {
            //            TimeRemaining = defalutTimeRemaining
            isShow = true
        } else {
            TimeRemaining -= 1
        }})
        
    }//body
}
//struct TimerView_Preiviews: PreviewProvider{
//    static var previews: some View{
//        TimerView()
//    }
//}
