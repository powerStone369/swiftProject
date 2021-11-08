//
//  Game.swift
//  Bullseye
//


import Foundation

struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game {
    var target = Int.random(in: 1..<100)
    var score = 0
    var round = 1
    var averageScore = 0
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 80, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 200, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 143, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 50, date: Date()))
        }
    }
    
    func points(sliderValue: Int) -> Int {
        let difference = abs(target - sliderValue)
        let bonus: Int
        
        if difference == 0 {
            bonus = 100
        } else if difference <= 2 {
            bonus = 50
        } else {
            bonus = 0
        }
        
        return 100 - difference + bonus
    }
    
    mutating func addToLeaderboard(point: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: averageScore, date: Date()))
        leaderboardEntries.sort {
            $0.score > $1.score
        }
    }

    mutating func startNewRound(points: Int) {
        score += points
        averageScore = score/round
        round += 1
        target = Int.random(in: 1..<100)
        
        
        if round==4 {
            
            addToLeaderboard(point: points)
            round = 1
            score = 0
            averageScore = 0
        }
        
    }
    
    mutating func restart() {
        score = 0
        averageScore = 0
        round = 1
        target = Int.random(in: 1..<100)
    }
}