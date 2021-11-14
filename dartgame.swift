import UIKit

var totalScore: Int = 0
var round: Int = 1
var round_: Int = 1
var tempScore: Int = 0
var roundScore: Int = 0
var SDT : String = ""

class Dart{
    
    
    func dartGame() -> Int{
        let ranSDT = Int.random(in: 1...100)
        var score = Int.random(in: 0...21)
        var multiple : Int
        
        //multiple calculation
        if 1 <= ranSDT && ranSDT <= 10 {
            multiple = 3
            SDT = "Triple"
        }
        else if 10 < ranSDT && ranSDT <= 30 {
            multiple = 2
            SDT = "Double"
        }
        else {
            multiple = 1
            SDT = "Single"
        }
        //multiple exception
        if score == 0 || score == 21 {
            multiple = 1
            SDT = "Single"
        }
        if score == 21 {
            score = 50
            SDT = "Single"
        }
        //Total Score
        totalScore += multiple*score
        tempScore = multiple*score
        roundScore += tempScore
        
        return multiple*score
    }
    
}

while round <= 10 {
    let i = Dart()
    i.dartGame()
    
    // round print
    if round_ >= 3 {
        print("Round \(round) Dart \(round_) : \(tempScore) points (\(SDT))")
        print("Total Score : \(totalScore)")
    }
    else {
        print("Round \(round) Dart \(round_) : \(tempScore) points (\(SDT))")
        print("Total Score : \(totalScore)")
    }
    
    // 301 constraint
    
    if totalScore == 301 {
        print("Yon win the Game in \(round) Round!")
        break
    }
    else if totalScore > 301 {
        print("Burst!")
        print()
        round += 1
        round_ = 1
        totalScore -= roundScore
        roundScore = 0
        
        continue
    }
    
    //round Count
    if round_ >= 3 {
        round_ = 1
        round += 1
        roundScore = 0
    }
    else {
        round_ = round_ + 1
    }
    
    print()
}

if round >= 10 && totalScore != 301 {
    print("You lose! Current point: \(totalScore)")
}



