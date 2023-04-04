import SwiftUI
 

struct TimesUpView: View {
    @State private var fadeInOut = false
    
    var body: some View {
        ZStack{
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            
            Rectangle()
                .opacity(0.5)
                .edgesIgnoringSafeArea(.all)
                .onAppear() {
                    withAnimation(Animation.easeInOut(duration: 0.6)
                        .repeatForever(autoreverses: true)) {
                            fadeInOut.toggle()
                        }
                }.opacity(fadeInOut ? 0 : 1)
            
            
            Text("Times Up!!")
                .font(.largeTitle)
                .foregroundColor(Color.red)
                .bold()
                
        }
        
                    
    }
}

//struct TimesUpView_Preiviews: PreviewProvider{
//    static var previews: some View{
//        TimesUpView()
//    }
//}
