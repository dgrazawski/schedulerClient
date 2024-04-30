//
//  SearchListModel.swift
//  SchedulerClient
//
//  Created by Dawid Grazawski on 28/04/2024.
//

import Foundation
import SwiftData

@Model
final class SearchListModel: Codable {
    var id: UUID
    var universityName: String
    var facultyName: String
    var year: Int
    var scheduleName: String
    var isCyclic: Bool
    
    init(id: UUID = UUID(), universityName: String = "UMK", facultyName: String = "WMII", year: Int = 1, scheduleName: String = "Informatyka", isCyclic: Bool = true) {
        self.id = id
        self.universityName = universityName
        self.facultyName = facultyName
        self.year = year
        self.scheduleName = scheduleName
        self.isCyclic = isCyclic
    }
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case universityName = "university_name"
        case facultyName = "faculty_name"
        case year = "year"
        case scheduleName = "schedule_name"
        case isCyclic = "is_cyclic"
        
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        universityName = try container.decode(String.self, forKey: .universityName)
        facultyName = try container.decode(String.self, forKey: .facultyName)
        year = try container.decode(Int.self, forKey: .year)
        scheduleName = try container.decode(String.self, forKey: .scheduleName)
        isCyclic = try container.decode(Bool.self, forKey: .isCyclic)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(universityName, forKey: .universityName)
        try container.encode(year, forKey: .year)
        try container.encode(facultyName, forKey: .facultyName)
        try container.encode(scheduleName, forKey: .scheduleName)
        try container.encode(isCyclic, forKey: .isCyclic)
    }
}
