import SwiftUI
import AVFoundation
class SoundManager : ObservableObject {
    var audioPlayer: AVPlayer?

    func playSound(sound: String){
        if let url = URL(string: sound) {
            self.audioPlayer = AVPlayer(url: url)
        }
    }
    func stopSound(){
        self.audioPlayer?.pause()
    }
}

struct Audio: View {
    @State var song1 = true
    @StateObject private var soundManager = SoundManager()
    
    var body: some View {
        Image(systemName: song1 ? "pause.circle.fill": "play.circle.fill")
            .font(.system(size: 25))
            .padding(.trailing)
            .onTapGesture {
                soundManager.playSound(sound: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3")
                song1.toggle()
                
                if song1{
                    soundManager.audioPlayer?.play()
                } else {
                    soundManager.audioPlayer?.pause()
                }
        }
        var _ = soundManager.playSound(sound: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3")
        var _ = soundManager.audioPlayer?.play()
    }
}
