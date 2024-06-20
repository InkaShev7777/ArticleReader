//
//  ApiManager.swift
//  TestApplication
//
//  Created by Ilya Schevchenko on 20.06.2024.
//

import Foundation
import Alamofire


final class ApiCaller {
    static let apiKey = "IjqECpjE9N5MVJP7pj6kjgjBM4r6hAdw"
    static let baseUrl = "https://api.nytimes.com/svc/mostpopular/v2/"
    static let shared = ApiCaller()
    
    private init() {}
    
    public func getMostEmailed() {
        AF.request("\(ApiCaller.baseUrl)emailed/30.json?api-key=\(ApiCaller.apiKey)").response { response in
            switch response.result {
            case .success(let data):
                do {
                    if let data = data {
                        let result = try JSONDecoder().decode(Article.self, from: data)
                        print(result.results.first?.media.first?.metaData.first?.url ?? "")
                    } else {
                        print("Data was nil")
                    }
                } catch {
                    print("Error during JSON serialization: \(error.localizedDescription)")
                }
            case .failure(let error):
                print("Request failed with error: \(error)")
            }
        }
    }
    
    public func getMostShared(completion: @escaping (Result) -> Void) {
        AF.request("\(ApiCaller.baseUrl)shared/30.json?api-key=\(ApiCaller.apiKey)").response { response in
            switch response.result {
            case .success(let data):
                do {
                    if let data = data {
                        let result = try JSONDecoder().decode(Article.self, from: data)
                        print(result.results.first?.media.first?.metaData.first?.url ?? "")
                    } else {
                        print("Data was nil")
                    }
                } catch {
                    print("Error during JSON serialization: \(error.localizedDescription)")
                }
            case .failure(let error):
                print("Request failed with error: \(error)")
            }
        }
    }
    
    public func getMostViewed(completion: @escaping (Result) -> Void) {
        AF.request("\(ApiCaller.baseUrl)viewed/30.json?api-key=\(ApiCaller.apiKey)").response { response in
            switch response.result {
            case .success(let data):
                do {
                    if let data = data {
                        let result = try JSONDecoder().decode(Article.self, from: data)
                        print(result.results.first?.media.first?.metaData.first?.url ?? "")
                    } else {
                        print("Data was nil")
                    }
                } catch {
                    print("Error during JSON serialization: \(error.localizedDescription)")
                }
            case .failure(let error):
                print("Request failed with error: \(error)")
            }
        }
    }
}
