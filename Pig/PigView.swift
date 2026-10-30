//
//  PigView.swift
//  Pig
//
//  WHAT THIS GAME DOES NOW
//  Pig is a dice game for three players who share one laptop.
//  Choose between three game lengths.
//  On your turn, roll the die as many times as you like.
//  Each roll adds to your turn total.
//  Roll a 1 or two consecutive 6s and you lose your turn total, and your turn is over.
//  Click Hold to bank your turn total into your score and end your turn.
//  The first player to reach the selected winning score wins.

import SwiftUI

// Each player has their own colour.
// TRY: Change these three colours. Try Color.purple, Color.green or Color.red.
let playerOneColor: Color = Color.pink
let playerTwoColor: Color = Color.green
let playerThreeColor: Color = Color.teal


// The game itself: what it remembers, what it shows on the screen,
// and what it does when you click a button.
struct PigView: View {
    
    // MARK: - Stored properties
    
    // Each @State variable is something the game remembers.
    // When one of them changes, the screen updates by itself.
    
    // The points each player has banked. Banked points are safe.
    @State var playerOneScore: Int = 0
    @State var playerTwoScore: Int = 0
    @State var playerThreeScore: Int = 0
    
    // The points collected so far on this turn.
    // They are not safe until the player clicks Hold.
    @State var turnTotal: Int = 0
    
    // Whose turn it is: 1, 2 or 3.
    @State var currentPlayer: Int = 1
    
    // The colour of whoever's turn it is.
    @State var turnColor: Color = playerOneColor
    
    // How many times the current player has rolled on this turn.
    @State var rollsThisTurn: Int = 0
    
    // The name of the SF Symbol that shows the die.
    @State var dieSymbol: String = "questionmark.square.fill"
    
    // A message that tells the players what just happened.
    @State var message: String = "Player 1 goes first. Click Roll to start."
    
    // Becomes true when somebody wins.
    @State var gameIsOver: Bool = false
    
    // In case a player rolls another 6, the computer will remeber the previous roll.
    @State var lastRoll: Int = 0
    
    // The winning score changes depending on the game length selected.
    @State var winningScore: Int = 0
    
    // A message that changes based on the game length selected.
    @State var winningScoreMessage: String = "Select a game length"
    
    // MARK: - Computed properties
    
    var body: some View {
        VStack(spacing: 12) {
            
            // The title at the top of the screen.
            HStack {
                Image(systemName: "dice.fill")
                Text("Pig")
            }
            .font(.largeTitle)
            .bold()
            
            // The scoreboard: one card for each player.
            HStack(spacing: 16) {
                VStack {
                    Text("Player 1")
                        .font(.headline)
                    Text("\(playerOneScore)")
                        .font(.system(size: 48, weight: .bold))
                        .monospacedDigit()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(playerOneColor.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                VStack {
                    Text("Player 2")
                        .font(.headline)
                    Text("\(playerTwoScore)")
                        .font(.system(size: 48, weight: .bold))
                        .monospacedDigit()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(playerTwoColor.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                VStack {
                    Text("Player 3")
                        .font(.headline)
                    Text("\(playerThreeScore)")
                        .font(.system(size: 48, weight: .bold))
                        .monospacedDigit()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(playerThreeColor.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
            Spacer()
            
            Text(winningScoreMessage)
                .font(.title)
                .foregroundStyle(Color.primary)
                .multilineTextAlignment(.center)
                .frame(minHeight: 24)
                .bold()
            
            // Buttons to change the winning score that must be pressed before the first roll
            HStack(spacing: 12) {
                Button("Short Game" , systemImage: "book.pages") {
                    winningScore = 50
                    winningScoreMessage = "Short: First player to 50 wins!"
                }
                
                .buttonStyle(.bordered)
                
                
                Button("Normal Game" , systemImage: "book.closed") {
                    winningScore = 100
                    winningScoreMessage = "Normal: First player to 100 wins!"
                }
                
                .buttonStyle(.bordered)
                
                Button("Long Game" , systemImage: "books.vertical") {
                    winningScore = 200
                    winningScoreMessage = "Long: First player to 200 wins!"
                }
                
                .buttonStyle(.bordered)
            }
                .disabled(winningScore != 0)
    
            // Say whose turn it is, that the game is over, or nothing if a game length has not been selected.
            if !gameIsOver && winningScore != 0 {
                Text("Player \(currentPlayer), your turn")
                    .font(.title)
                    .foregroundStyle(turnColor)
            } else if winningScore == 0 {
                Text("")
            } else {
                Text("Game over")
                    .font(.title)
                    .bold()
                    .foregroundStyle(turnColor)
            }
            
            // The die.
            // TRY: Change the size of the die from 120 to something bigger or smaller.
            Image(systemName: dieSymbol)
                .font(.system(size: 120))
                .foregroundStyle(turnColor)
            Text("Turn total: \(turnTotal)    Rolls: \(rollsThisTurn)")
                .font(.title2)
                .bold()
                .monospacedDigit()
            
            Text(message)
                .font(.headline)
                .foregroundStyle(Color.secondary)
                .multilineTextAlignment(.center)
                .frame(minHeight: 44)
            
            Spacer()
            
            // The two buttons a player uses on their turn.
            // The code inside the braces runs when that button is clicked.
            HStack(spacing: 16) {
                Button("Roll", systemImage: "dice") {
                    rollDie()
                }
                .buttonStyle(.borderedProminent)
                
                Button("Hold", systemImage: "hand.raised.fill") {
                    hold()
                }
                .buttonStyle(.bordered)
            }
            .font(.title2)
            .bold()
            .controlSize(.large)
            .tint(turnColor)
            // Nobody can roll or hold once the game is over.
            .disabled(gameIsOver)
            .disabled(winningScore == 0)
            
            Button("New Game" , systemImage:"arrow.counterclockwise") {
                startNewGame()
                gameIsOver = false
            }
            
  
            
        }
        .padding(32)
        .fontDesign(.rounded)
        // How big the game's window is on the Mac. It can be made taller or wider.
        .frame(minWidth: 480, minHeight: 680)

    }
    // MARK: - Functions
    
    // Picks a random whole number from 1 to 6, just like a real die.
    func rollOneDie() -> Int {
        let roll: Int = Int.random(in: 1...6)
        return roll
    }
    
    
    // Answers true when a score is high enough to win.
    func hasWon(score: Int) -> Bool {
        return score >= winningScore
    }
    
    // Rolls the die once for the current player.
    func rollDie() {
        
        
        // Pick a random whole number from 1 to 6, just like a real die.
        let roll: Int = rollOneDie()
        rollsThisTurn += 1
        
        // Show the matching die face. For a roll of 4, the symbol is "die.face.4.fill".
        dieSymbol = "die.face.\(roll).fill"
        
        if roll == 1 {
            // A 1 wipes out the turn total and ends the turn.
            message = "Oh no, a 1! Player \(currentPlayer) loses \(turnTotal) points."
            turnTotal = 0
            switchPlayer()
        } else if roll == 6 && lastRoll == 6 {
            // Rolling two 6s whipes out the turn total and ends the turn
            message = "Oh no, another 6! Player \(currentPlayer) loses \(turnTotal) points"
            turnTotal = 0
            switchPlayer()
        } else {
            // Any other roll is added to the turn total.
            turnTotal += roll
            // TRY: Change this message.
            message = "You rolled a \(roll). Roll again, or hold?"
        }
        // Remeber the last roll
        lastRoll = roll
    }
    
    // Banks the turn total into the current player's score, then ends the turn.
    func hold() {
        if currentPlayer == 1 {
            playerOneScore += turnTotal
        } else if currentPlayer == 2 {
            playerTwoScore += turnTotal
        } else {
            playerThreeScore += turnTotal
        }
        
        // Has any player reached the winning score?
        let someoneHasWon: Bool = hasWon(score: playerOneScore) || hasWon(score: playerTwoScore) || hasWon(score: playerThreeScore)
        
        if someoneHasWon {
            message = "Player \(currentPlayer) wins! Click New Game to play again."
            dieSymbol = "trophy.fill"
            turnTotal = 0
            gameIsOver = true
        } else {
            message = "Player \(currentPlayer) banked \(turnTotal) points."
            turnTotal = 0
            switchPlayer()
        }
    }
    
    // Passes the turn to the next player.
    func switchPlayer() {
        rollsThisTurn = 0
        
        // The remainder does the switching: 1 becomes 2, 2 becomes 3, 3 becomes 1
        currentPlayer = currentPlayer % 3 + 1
        
        if currentPlayer == 1 {
            turnColor = playerOneColor
        } else if currentPlayer == 2 {
            turnColor = playerTwoColor
        } else {
            turnColor = playerThreeColor
            
        }
    }
    
    // Sets everything back to the way it was at the start.
    func startNewGame() {
        playerOneScore = 0
        playerTwoScore = 0
        playerThreeScore = 0
        turnTotal = 0
        currentPlayer = 1
        turnColor = playerOneColor
        rollsThisTurn = 0
        winningScore = 0
        dieSymbol = "questionmark.square.fill"
        message = "Player 1 goes first. Click Roll to start."
        winningScoreMessage = "Select a game length!"
    }
}

#Preview {
    PigView()
}
