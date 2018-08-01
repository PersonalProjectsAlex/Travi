//
//  APIManager.swift
//  travi
//
//  Created by Administrador on 29/03/18.
//


import Foundation
import Alamofire
import CodableAlamofire

typealias Params = [String: Any]?

class APIManager {
    
    func request<T: Codable>(endpoint: String, completionHandler: @escaping (T?) -> Void, method: HTTPMethod = .post, params: Parameters? = nil, keyPath: String? = nil) {
        
        let url = URL(string: endpoint)!
        let utilityQueue = DispatchQueue.global(qos: .utility)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        print("Endpoint: \(endpoint), \(method)")
        print("Params: \(params as? NSDictionary)")
        Alamofire.SessionManager.default.session.configuration.timeoutIntervalForRequest = 15
        let a = HTTPHeaders()
        Alamofire.request(url, method: method, parameters: params, headers: a)
            .responseDecodableObject(queue: utilityQueue, keyPath: keyPath, decoder: decoder) { (response: DataResponse<T>) in
                
                //print(response)
                response.result.ifFailure { print("ERROR: \(response.result.error.debugDescription)") }
                DispatchQueue.main.sync {
                    if let object = response.value { completionHandler(object) }
                    else { completionHandler(nil) }
                }
        }
        
    }
    
}
