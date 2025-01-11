//
//  DrahimServicesView.swift
//  DrahimTask
//
//  Created by Ashwaq Alghamdi on 10.01.2025.
//

import SwiftUI

struct DrahimServicesView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel = ServiceViewModel()
    @State private var searchText = ""
    
    var filteredSections: [Sections] {
        guard !searchText.isEmpty else {
            return viewModel.content?.sections ?? []
        }
        
        return viewModel.content?.sections.filter { section in
            section.sectionTitle.localizedCaseInsensitiveContains(searchText) ||
            section.services.contains(where: { $0.title.localizedCaseInsensitiveContains(searchText) }) ||
            section.services.contains(where: { $0.subTitle.localizedCaseInsensitiveContains(searchText) })
        } ?? []
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                Text("Drahim Services")
                    .bold()
                    .font(.largeTitle)
                    .padding(.leading)
                List {
                    ForEach(filteredSections, id: \.self) { section in
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
            .searchable(text: $searchText)
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
