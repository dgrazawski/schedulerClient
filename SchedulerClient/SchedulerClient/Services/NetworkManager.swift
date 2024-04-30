//
//  NetworkManager.swift
//  SchedulerClient
//
//  Created by Dawid Grazawski on 30/04/2024.
//

import Foundation
import Combine
import SwiftData

class NetworkManager: ObservableObject {
    var cancellables = Set<AnyCancellable>()
    @Published var showAlert: Bool = false
    @Published var message: String? = nil
    @Published var searchList: [SearchListModel] = []
    @Published var meetingsList: [MeetingModel] = []
    
    
    func getDataSearch(request: URLRequest) {
        URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .decode(type: [SearchListModel].self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    print("Success")
                case .failure(_):
                    print("Failed")
                }
            } receiveValue: { [weak self] response in
                print(response.count)
                self?.searchList = response
                
                
            }
            .store(in: &cancellables)

    }
    
    func loadMeetings(request: URLRequest) {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyy"
        var decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter)
        URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .decode(type: [MeetingModel].self, decoder: decoder)
            .sink { (completion) in
                switch completion {
                    
                case .finished:
                    print("Success")
                case .failure(let error):
                    print(error)
                    
                }
            } receiveValue: { [weak self] response in
                print("meetings value: \(response.count)")
                self?.meetingsList = response
            }
            .store(in: &cancellables)

    }
    
    
    
}

enum HTTPMethod: String {
    case post = "POST"
    case put = "PUT"
    case get = "GET"
    case delete = "DELETE"
}

enum Routes: String {
    case account = "/account"
    case schedule = "/schedule"
    case lecturer = "/lecturer"
    case room = "/room"
    case subject = "/subject"
    case meeting = "/meeting"
    case group = "/group"
    case allocation = "/allocation"
    case cyclic = "/cyclic"
    case nonCyclic = "/non_cyclic"
    case client = "/client"
    
}

enum Endpoint: String {
    case register = "/register"
    case login = "/login"
    case changePass = "/change_pass"
    case add = ""
    case edit, delete = "/"
    case getAll = "/get_all"
    case clientGetSchedules = "/get_schedules"
    case clientGetMeetings = "/get_meetings/"
}

struct APIResponse: Codable {
    let message: String
   // let code: Int
}

struct LoginData: Codable {
    let username: String
    let password: String
}

struct Token: Codable {
    let token: String
}

struct ChangePassword: Codable{
    let old_pass: String
    let new_pass: String
}

struct URLRequestBuilder {
    var baseURL: String = "127.0.0.1"
    var basePort: Int = 5000
    
    
    func createURL(route: Routes, endpoint: Endpoint, parameter: String = "") -> URL? {
        var components: URLComponents = URLComponents()
        components.scheme = "http"
        components.host = baseURL
        components.port = basePort
        components.path = route.rawValue + endpoint.rawValue + parameter
        return components.url
    }
    
    func createRequest(method: HTTPMethod, url: URL, body: Data? = nil) -> URLRequest? {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if let requestBody = body {
            request.httpBody = requestBody
        }
        return request
    }
    
    
}
