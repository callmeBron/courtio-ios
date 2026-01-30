import Foundation
import SwiftUI
import Combine

class MatchManager: ObservableObject {
    @StateObject private var timeManager = GameTimeManager()
    
    @Published var playerScore: Int = Constants.MatchConstants.playerScore
    @Published var opponentScore: Int = Constants.MatchConstants.opponentScore
    @Published var matchState: MatchState = .readyToStart
    @Published var gameNumber: Int = 1
    @Published var runTime: Int = 0
    
    private var pointsToWin: Int = 11
    private var winMargin: Int = 2
    
    init(pointsToWin: Int, winMargin: Int) {
        self.pointsToWin = pointsToWin
        self.winMargin = winMargin
    }
    
    func startMatch() {
        timeManager.startTimer()
        playerScore = Constants.MatchConstants.playerScore
        opponentScore = Constants.MatchConstants.opponentScore
        gameNumber = 1
        updateState(.inProgress)
    }
    
    func playerScored() {
        guard matchState == .inProgress else { return }
        playerScore += 1
        checkGameEnd()
    }
    
    func opponentScored() {
        guard matchState == .inProgress else { return }
        opponentScore += 1
        checkGameEnd()
    }
    
    func undoLastPoint() {
        // You'll want to track point history for this
        // For now, simple decrement
    }
    
    private func checkGameEnd() {
        let maxScore = max(playerScore, opponentScore)
        let scoreDiff = abs(playerScore - opponentScore)
        
        if maxScore >= pointsToWin && scoreDiff >= winMargin {
            endMatch()
        }
    }
    
    func endMatch() {
        timeManager.invalidateTimer()
        updateState(.ended)
        // TODO: Save to persistent storage
    }
    
    
}

extension MatchManager {
    private func updateState(_ state: MatchState) {
        self.matchState = state
    }
}
