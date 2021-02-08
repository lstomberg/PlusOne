//
//  ScoreBar.swift
//  PlusOne
//
//  Created by Lucas Stomberg on 2/7/21.
//

import Foundation
import SwiftUI

struct ScoreBar: View {
    let score: String
    let time: String?

    init(score: Int, timeRemaining: Int? = nil) {
        self.score = String(format: "% 4i", score)
        
        if let timeRemaining = timeRemaining {
            let seconds = timeRemaining % 60
            let minutes = (timeRemaining / 60)
            self.time = String(format: "%02d:%02d", minutes, seconds)
        } else {
            self.time = nil
        }
    }
    
    var body: some View {
        HStack(alignment: .center) {
            HStack {
                Text("$").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.accentColor)
                Text(score).font(.title3)
            }
            Spacer()
            if let time = time {
                HStack {
                    Text(time).font(.title2)
                    Image(systemName: "clock").font(.title2).foregroundColor(.accentColor)
                }
            }
        }
    }
}

// MARK: Preview

#if DEBUG

struct ScoreBar_Previews: PreviewProvider {
    static var previews: some View {
        ScoreBar(score: 152, timeRemaining: 72)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 300, height: 50))
        ScoreBar(score: 1, timeRemaining: 72)
            .previewLayout(.fixed(width: 300, height: 50))
    }
}

#endif
