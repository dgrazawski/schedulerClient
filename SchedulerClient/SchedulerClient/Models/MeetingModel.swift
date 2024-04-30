//
//  MeetingModel.swift
//  SchedulerClient
//
//  Created by Dawid Grazawski on 28/04/2024.
//

import Foundation
import SwiftData

@Model
final class MeetingModel: Identifiable, Decodable {
    var id: UUID
    var scheduleID: UUID
    var startDate: Date
    var endDate: Date
    var dateSpan: [Date]
    
    init(id: UUID = UUID(), scheduleID:UUID = UUID(), startDate: Date = Date(), endDate: Date = Date(), dateSpan: [Date] = []) {
        self.id = id
        self.scheduleID = scheduleID
        self.startDate = startDate
        self.endDate = endDate
        self.dateSpan = dateSpan
    }
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case scheduleID = "schedule_id"
        case startDate = "start_date"
        case endDate = "end_date"
        
        
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        scheduleID = try container.decode(UUID.self, forKey: .scheduleID)
        startDate = try container.decode(Date.self, forKey: .startDate)
        endDate = try container.decode(Date.self, forKey: .endDate)
        dateSpan = []
    }
    
    func countSpan(startDate: Date, endDate: Date) -> [Date] {
        var dates: [Date] = []
            var date = startDate
            
            while date <= endDate {
                dates.append(date)
                guard let nextDay = Calendar.current.date(byAdding: .day, value: 1, to: date) else { break }
                date = nextDay
            }
            
            return dates
    }
}
