//
//  ServiceViewModel.swift
//  DrahimTask
//
//  Created by Ashwaq Alghamdi on 10.01.2025.
//

import Foundation
import SwiftUI

class ServiceViewModel: ObservableObject {
    
    @Published var content: Content?
    
    func load() {
        guard let url = Bundle.main.url(forResource: "Data", withExtension: "json") else {
            print("Error: Data JSON file not found.")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            content = try decoder.decode(Content.self, from: data)
            print("data JSON loaded successfully")
        } catch {
            print("Error decoding data JSON: \(error)")
        }
    }
}
