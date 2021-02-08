//
//  PromptView.swift
//  PlusOne
//
//  Created by Lucas Stomberg on 2/7/21.
//

import Foundation
import SwiftUI

struct CurrentNumber: View {
    let number: String
    private let numberFont = Font.system(size: 80, weight: .medium, design: .monospaced)
    
    var body: some View {
        Text(number)
            .font(numberFont)
            .padding(.init(top: 10, leading: 15, bottom: 10, trailing: 15))
            .background(RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .foregroundColor(.accentColor))
    }
}

struct InputNumber: View {
    let input: Binding<String>
    let underlineColor: Color?
    private let inputFont = Font.system(size: 60, weight: .medium, design: .monospaced)
    
    var body: some View {
        TextField("", text: input)
            .accentColor(.clear)
            .multilineTextAlignment(.center)
            .font(inputFont)
            .lineLimit(1)
            .frame(width: 200)
            .background(Rectangle().frame(height: 1)
                            .foregroundColor(underlineColor),
                        alignment: .bottom)
            .keyboardType(.numberPad)
            .fixedSize()
    }
}

struct PromptView: View {
    let displayNumber: String
    let text: Binding<String>
    let lastResultColor: Color?
    
    var body: some View {
        VStack {
            CurrentNumber(number: displayNumber).padding()
            InputNumber(input: text, underlineColor: lastResultColor)
        }
    }
}

// MARK: Previews

#if DEBUG

struct PromptView_Previews: PreviewProvider {
    static var previews: some View {
        PromptView(displayNumber: "6768",
                   text: .constant("787"),
                   lastResultColor: .red)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 300, height: 300))
        
        PromptView(displayNumber: "123",
                   text: .constant("234"),
                   lastResultColor: .green)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 300, height: 300))
        
        PromptView(displayNumber: "67681",
                   text: .constant("12332"),
                   lastResultColor: .gray)
            .previewLayout(.fixed(width: 300, height: 300))
    }
}

#endif
