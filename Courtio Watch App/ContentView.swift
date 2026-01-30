import SwiftUI

struct WatchMatchView: View {
    @StateObject var manager = MatchManager(pointsToWin: 11,
                                            winMargin: 2)
    @State var waitingToStartTime: Int = 0
    
    var body: some View {
        switch manager.matchState {
        case .readyToStart:
            readyToStart()
        case .inProgress:
            gameInProgressView()
        case .ended:
            matchEndView()
        }
    }
    
    @ViewBuilder private func readyToStart() -> some View {
        VStack(spacing: 15) {
            Text("Welcome to courto")
                .bold()
                .font(.title3)
                        
            Button("start game") {
                manager.startMatch()
            }
            .symbolEffect(.breathe, value: waitingToStartTime)
            .symbolRenderingMode(.hierarchical)
            .foregroundStyle(.green)
            
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                self.waitingToStartTime += 1
            }
        }
    }
    
    @ViewBuilder private func matchEndView() -> some View {
        VStack {
            Text("game over")
        }
    }
    
    @ViewBuilder private func gameInProgressView() -> some View {
        VStack(spacing: 10) {
            Text("0:01")
                .font(.caption2)
                .foregroundStyle(.green)
                .padding(.bottom, 5)
            
            HStack(alignment: .center, spacing: 10) {
                VStack(spacing: 5){
                    Text("Opp")
                        .font(.caption2)
                    Text("\(manager.opponentScore)")
                        .font(.body)
                }
                VStack(spacing: 5){
                    Text("YOU")
                        .font(.caption2)
                    Text("\(manager.playerScore)")
                        .font(.body)
                }
            }
            .frame(maxWidth: .infinity)
            
            HStack(spacing: 10) {
                Button("op") {
                    manager.opponentScored()
                }
                
                Divider()
                    .frame(width: 0.5,height: 30)
                
                Button("u") {
                    manager.playerScored()
                }
            }
            
            HStack(spacing: 20) {
                Image(systemName: "playpause.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(.yellow)
                    .onTapGesture {
                        // pause functionality
                    }
                
                Image(systemName: "arrow.uturn.backward.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(.gray)
                    .onTapGesture {
                        // undo functionality
                    }

            }
        }
        .padding()
    }
}

#Preview {
    WatchMatchView()
}
