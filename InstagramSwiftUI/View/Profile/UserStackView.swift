//
//  UserStackView.swift
//  InstagramSwiftUI
//
//  Created by Nikita Popov on 11.07.2021.
//

import SwiftUI

struct UserStackView: View {
    // MARK: - Properties
    var value: Int
    var title: String
    
    // MARK: - Body
    var body: some View {
        VStack {
            Text("\(value)").font(.system(size: 15, weight: .semibold))
            
            Text(title)
                .font(.system(size: 15))
        }
        .frame(width: 80, alignment: .center)
    }
}

struct UserStackView_Previews: PreviewProvider {
    static var previews: some View {
        UserStackView(value: 2, title: "Followers")
    }
}
