import SwiftUI

struct MatchSetupView: View {
    @State var isPhoneSelected = false
    @State var isWatchSelected = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack {
                Text("Choose a device")
                HStack {
                    VStack(spacing: 15) {
                        Image(systemName: "applewatch")
                        Text("Score on Watch")
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.orange, style: .init(lineWidth: isWatchSelected ? 2 : 0))
                    )
                    .onTapGesture {
                        isPhoneSelected = false
                        isWatchSelected = true
                    }
                    
                    VStack(spacing: 15) {
                        Image(systemName: "iphone.gen3")
                        Text("Score on Phone")
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.orange, style: .init(lineWidth: isPhoneSelected ? 2 : 0))
                    )
                    .onTapGesture {
                        isPhoneSelected = true
                        isWatchSelected = false
                    }
                }
            }
            
            Text("Game Setup")
            
            HStack(spacing: 15) {
                Text("Squash")
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 10).foregroundStyle(.gray).opacity(0.5))
                
                Text("Custom")
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 10).foregroundStyle(.gray).opacity(0.5))
            }
            
            HStack(spacing: 15) {
                Text("Single game")
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 10).foregroundStyle(.gray).opacity(0.5))
                Text("Best of 3")
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 10).foregroundStyle(.gray).opacity(0.5))
                Text("Best of 5")
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 10).foregroundStyle(.gray).opacity(0.5))
            }
        }
        .padding()
    }
}

#Preview {
    MatchSetupView()
}
