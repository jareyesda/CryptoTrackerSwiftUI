//
//  UIApplication.swift
//  CryptoTrackerSwiftUI
//
//  Created by Juan Reyes on 8/25/21.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
