//
//  GameScreen.swift
//  PlusOne
//
//  Created by Lucas Stomberg on 2/7/21.
//

import Foundation
import SwiftUI

// MARK: View

struct GameScreen: View {
    // Properties
    private let length: Int
    private var score: Binding<Int>
    @State private var timeRemaining: Int?
    @State private var userInput: String = ""
    @State private var challenge: Challenge
    @State private var lastResult: Result = .none
    
    // Init
    init(length: Int, score: Binding<Int>, timeRemaining: Int?) {
        self.length = length
        self.score = score
        _timeRemaining = .init(initialValue: timeRemaining)
        _challenge = .init(initialValue: .init(length: length))
    }
    
    // Logic
    private func checkForSolution() {
        guard userInput.count == challenge.answer.count else {
            return
        }
        
        let isCorrect = (userInput == challenge.answer)
        self.score.wrappedValue += isCorrect ? 1 : -1
        self.lastResult = isCorrect ? .success : .fail
        
        // new round
        self.userInput = ""
        self.challenge = Challenge(length: length)
    }
    
    // View
    var body: some View {
        VStack {
            ScoreBar(score: score.wrappedValue, timeRemaining: timeRemaining)
            Spacer()
            PromptView(displayNumber: challenge.displayNumber,
                       text: $userInput,
                       lastResultColor: lastResult.displayColor())
            Spacer()
            HelpText(text: "Enter a number where each digit is 1 above the displayed number.")
        }.onChange(of: userInput) { _ in
            // ensure only numeric content
            userInput = userInput.filter("0123456789".contains)
            checkForSolution()
        }.onAppear() {
            UIApplication.shared.somethingBecomeFirstResponder()
        }
    }
    
    // State
    enum Result {
        case success
        case fail
        case none
    }
}

// MARK: Model

struct Challenge {
    let displayNumber: String
    let answer: String
    
    init(length: Int) {
        self.displayNumber = String.randomNumeric(ofLength: length)
        
        // run logic up front
        let base = Int(displayNumber)!
        let digits = displayNumber.count
        let addition = Int(String(repeating: "1", count: digits))!
        self.answer = String(base + addition)
    }
}

extension GameScreen.Result {
    func displayColor() -> Color? {
        switch self {
        case .success: return .green
        case .fail: return .red
        case .none: return nil
        }
    }
}

// MARK: Previews

#if DEBUG

struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen(length: 2, score: .constant(1558), timeRemaining: 22)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 300, height: 400))
        GameScreen(length: 4, score: .constant(0), timeRemaining: nil)
            .previewLayout(.fixed(width: 300, height: 400))
    }
}

#endif
