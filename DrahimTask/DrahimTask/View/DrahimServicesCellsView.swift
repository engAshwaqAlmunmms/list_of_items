//
//  DrahimServicesCellsView.swift
//  DrahimTask
//
//  Created by Ashwaq Alghamdi on 10.01.2025.
//

import SwiftUI

struct DrahimServicesCellsView: View {
    
    @Binding var serviceImage: String
    @Binding var serviceTitle: String
    @Binding var serviceSubTitle: String
    @Binding var appearance: Appearance
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        HStack {
            Image(uiImage: UIImage(named:"\(serviceImage).\(appearance.rawValue)") ?? UIImage())
            VStack(alignment: .leading) {
                Text(serviceTitle)
                    .foregroundStyle(Color.black)
                    .bold()
                Text(serviceSubTitle)
                    .foregroundStyle(Color.gray)
            }
            NavigationLink("") {
                WelcomeView()
            }.foregroundStyle(Color.gray)
        }
    }
}
