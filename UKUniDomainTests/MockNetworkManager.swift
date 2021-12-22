//
//  MockNetworkManager.swift
//  UKUniDomainTests
//
//  Created by Suman Gurung on 22/12/2021.
//

import Foundation
import Combine
@testable import UKUniDomain

class MockNetworkManager: Networking {
    
    func getUni<T>(urlString: String, type: T.Type) -> Future<[T], NetworkError> where T : Decodable {
        return Future { promise in
            if let url = Bundle(for: MockNetworkManager.self).url(forResource: urlString, withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode([T].self, from: data)
                    promise(.success(jsonData))
                } catch {
                    print("error while decoding the JSON data")
                    promise(.failure(NetworkError.parsingError))
                }
            } else {
                promise(.failure(NetworkError.dataNotFound))
            }
        }
    }
    
}
