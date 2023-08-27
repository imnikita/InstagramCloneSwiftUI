//
//  Extensions.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 10.07.2021.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
