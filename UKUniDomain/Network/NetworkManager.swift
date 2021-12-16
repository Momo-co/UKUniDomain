//
//  NetworkManager.swift
//  UKUniDomain
//
//  Created by Suman Gurung on 15/12/2021.
//

import Foundation
import Combine

protocol Networking {
    func getUni<T:Decodable>(urlString:String, type:T.Type) -> Future<[T], Error>
}

class NetworkManager: Networking {
    func getUni<T:Decodable>(urlString:String, type:T.Type) -> Future<[T], Error> {
        return Future { promise in
            let urlSession = URLSession.shared
            guard let url = URL(string: urlString) else {
                return
            }
            
            let dataTask = urlSession.dataTask(with: url) { data, urlResponse, error in
                guard let _data = data else {
                    return
                }
                
                let jsonDecoder = JSONDecoder()
                
                do{
                    let universities = try jsonDecoder.decode([T].self, from: _data)
                    
                    promise(.success(universities))
                } catch {
                    promise(.failure(error))
                }
            }
            dataTask.resume()
        }
    }
}
