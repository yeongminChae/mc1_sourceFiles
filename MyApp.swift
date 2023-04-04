import SwiftUI

    @main
struct MyApp: App {

    var body: some Scene {
        WindowGroup {
            Story1()
                        
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      Story1().previewInterfaceOrientation(.landscapeRight)
    }
}
