//
//  AllocationModel.swift
//  SchedulerClient
//
//  Created by Dawid Grazawski on 30/04/2024.
//

import Foundation
import SwiftData

@Model
final class AllocationModel: Identifiable, Hashable, Decodable {
    var id: UUID
    var scheduleID: UUID
    var lecturerName: String
    var groupName: String
    var groupType: String
    var subjectName: String
    var roomNumber: String
    
    init(id: UUID = UUID(), scheduleID: UUID = UUID(), lecturerName: String = "", groupName: String = "", groupType: String = "", subjectName: String = "", roomNumber: String = "") {
        self.id = id
        self.scheduleID = scheduleID
        self.lecturerName = lecturerName
        self.groupName = groupName
        self.groupType = groupType
        self.subjectName = subjectName
        self.roomNumber = roomNumber
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case scheduleID = "schedule_id"
        case lecturerName = "lecturer_name"
        case groupName = "group_name"
        case groupType = "group_type"
        case subjectName = "subject_name"
        case roomNumber = "room_number"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        scheduleID = try container.decode(UUID.self, forKey: .scheduleID)
        lecturerName = try container.decode(String.self, forKey: .lecturerName)
        groupName = try container.decode(String.self, forKey: .groupName)
        groupType = try container.decode(String.self, forKey: .groupType)
        subjectName = try container.decode(String.self, forKey: .subjectName)
        roomNumber = try container.decode(String.self, forKey: .roomNumber)
    }
}
