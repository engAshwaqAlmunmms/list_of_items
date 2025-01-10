//
//  Service.swift
//  DrahimTask
//
//  Created by Ashwaq Alghamdi on 11.01.2025.
//

import Foundation

enum Appearance: String, Codable {
    case light = "light"
    case dark = "dark"
}

struct Service: Codable, Hashable {
    var title: String = ""
    var subTitle: String = ""
    var image: String = ""
}

struct Sections: Codable, Hashable {
    var sectionTitle: String = ""
    var services: [Service] = []
}

struct Content: Codable, Hashable {
    var sections: [Sections] = []
}
