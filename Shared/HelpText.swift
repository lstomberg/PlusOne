//
//  HelpText.swift
//  PlusOne
//
//  Created by Lucas Stomberg on 2/7/21.
//

import Foundation
import SwiftUI

struct HelpText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.callout)
            .padding(.horizontal, 10)
    }
}
