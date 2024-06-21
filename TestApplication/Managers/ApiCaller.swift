//
//  ApiManager.swift
//  TestApplication
//
//  Created by Ilya Schevchenko on 20.06.2024.
//

import Foundation
import Alamofire


final class ApiCaller {
    static private let apiKey = "IjqECpjE9N5MVJP7pj6kjgjBM4r6hAdw"
    static private let baseUrl = "https://api.nytimes.com/svc/mostpopular/v2/"
    static let shared = ApiCaller()
    
    private init() {}
    
    enum Result<Success, Failure: Error> {
        case success(Success)
        case failure(Failure)
    }
    
    enum APIError: Error{
            case failedToGetData
        }
    
    public func getMostEmailed(completion: @escaping (Result<[Results], Error>) -> Void) {
        let url = "https://api.nytimes.com/svc/mostpopular/v2/emailed/1.json?api-key=IjqECpjE9N5MVJP7pj6kjgjBM4r6hAdw"
        
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let articleResponse = try decoder.decode(Article.self, from: data)
                    completion(.success(articleResponse.results))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
//    public func getMostShared(completion: @escaping (Result<Article, Error>) -> Void) {
//        AF.request("\(ApiCaller.baseUrl)shared/30.json?api-key=\(ApiCaller.apiKey)").response { response in
//            switch response.result {
//            case .success(let data):
//                do {
//                    if let data = data {
//                        let result = try JSONDecoder().decode(Article.self, from: data)
//                        print(result.results.first?.media.first?.metaData.first?.url ?? "")
//                    } else {
//                        print("Data was nil")
//                    }
//                } catch {
//                    print("Error during JSON serialization: \(error.localizedDescription)")
//                }
//            case .failure(let error):
//                print("Request failed with error: \(error)")
//            }
//        }
//    }
//    
//    public func getMostViewed(completion: @escaping (Result<Article, Error>) -> Void) {
//        AF.request("\(ApiCaller.baseUrl)viewed/30.json?api-key=\(ApiCaller.apiKey)").response { response in
//            switch response.result {
//            case .success(let data):
//                do {
//                    if let data = data {
//                        let result = try JSONDecoder().decode(Article.self, from: data)
//                        print(result.results.first?.media.first?.metaData.first?.url ?? "")
//                    } else {
//                        print("Data was nil")
//                    }
//                } catch {
//                    print("Error during JSON serialization: \(error.localizedDescription)")
//                }
//            case .failure(let error):
//                print("Request failed with error: \(error)")
//            }
//        }
    }

