import SwiftUI
import Combine

struct StopwatchView: View {
    @State private var timeElapsed: TimeInterval = 0
    @State private var isRunning = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Spacer()
            
            Text(formatTime(timeElapsed))
                .font(.system(size: 60, weight: .bold, design: .monospaced))
            
            HStack(spacing: 40) {
                Button(isRunning ? "Pause" : "Start") {
                    isRunning.toggle()
                }
                .buttonStyle(.borderedProminent)
                .tint(isRunning ? .orange : .green)

                Button("Reset") {
                    timeElapsed = 0
                    isRunning = false
                }
                .buttonStyle(.bordered)
                .tint(.red)
            }
            
            Spacer()
            
            VStack {
                Text("Laps")
                    .font(.title2)
                    .padding()
                Divider()
            }
            Spacer()
        }
        .padding()
        .onReceive(timer) { _ in
            if isRunning {
                timeElapsed += 1
            }
        }
        .navigationTitle("Stopwatch")
    }

  
    func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    NavigationStack {
        StopwatchView()
    }
}
