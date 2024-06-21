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
        let url = "\(ApiCaller.baseUrl)emailed/30.json?api-key=\(ApiCaller.apiKey)"
        
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
    
    public func getMostShared(completion: @escaping (Result<[Results], Error>) -> Void) {
        let url = "\(ApiCaller.baseUrl)shared/30.json?api-key=\(ApiCaller.apiKey)"
        
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
    
    public func getMostViewed(completion: @escaping (Result<[Results], Error>) -> Void) {
        let url = "\(ApiCaller.baseUrl)viewed/30.json?api-key=\(ApiCaller.apiKey)"
        
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
}

