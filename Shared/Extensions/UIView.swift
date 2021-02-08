//
//  UIView.swift
//  PlusOne
//
//  Created by Lucas Stomberg on 2/7/21.
//

import Foundation
import UIKit

extension UIView {
    func somethingBecomeFirstResponder() -> Bool {
        if self.becomeFirstResponder() {
            return true
        }
        
        let view: UIView? = subviews.first { $0.somethingBecomeFirstResponder() }
        return (view != nil)
    }
}

extension UIApplication {
    func somethingBecomeFirstResponder() {
        _ = windows.first?.somethingBecomeFirstResponder()
    }
}
