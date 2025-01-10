//
//  DrahimServicesView.swift
//  DrahimTask
//
//  Created by Ashwaq Alghamdi on 10.01.2025.
//

import SwiftUI

// search

struct DrahimServicesView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel = ServiceViewModel()
        
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                Text("Drahim Services")
                    .bold()
                    .font(.largeTitle)
                    .padding(.leading)
                List {
                    ForEach(viewModel.content?.sections ?? [], id: \.self) { section in
                        Section(header: Text(section.sectionTitle).bold().padding(.leading, -20)) {
                            ForEach(section.services, id: \.self) { service in
                                DrahimServicesCellsView(serviceImage: .constant(service.image),
                                                        serviceTitle: .constant(service.title),
                                                        serviceSubTitle: .constant(service.subTitle),
                                                        appearance: .constant(colorScheme == .dark ? .dark: .light))
                            }
                        }
                        .listRowBackground(Color.white)
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.clear)
            }
            .background(colorScheme == .dark ? Color(UIColor.black): Color(red: 238/255, green: 238/255, blue: 238/255))
            .onAppear {
                viewModel.load()
            }
        }
    }
}

#Preview {
    DrahimServicesView()
}
