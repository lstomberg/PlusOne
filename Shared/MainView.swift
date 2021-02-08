//
//  ContentView.swift
//  Shared
//
//  Created by Lucas Stomberg on 2/6/21.
//

import SwiftUI

struct MainView: View {
    @State private var score: Int
    
    init() {
        // load score
        _score = .init(initialValue: Store.score)
    }
    
    var body: some View {
        Group {
            GameScreen(length: 4,
                       score: $score,
                       timeRemaining: nil)
                .padding(10)
        }
        .statusBar(hidden: true)
        .onChange(of: score) { _ in
            // store score to disk
            Store.score = score
        }
    }
}

// MARK: Previews

#if DEBUG

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().preferredColorScheme(.dark)
        
        MainView()
    }
}

#endif
