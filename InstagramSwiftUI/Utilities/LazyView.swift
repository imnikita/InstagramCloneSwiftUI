//
//  LazyView.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 15.07.2021.
//

import SwiftUI

struct LazyView<Content : View>: View {
    let build: () -> Content
    
    init(build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
