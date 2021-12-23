//
//  UniversityViewModel.swift
//  UKUniDomain
//
//  Created by Suman Gurung on 16/12/2021.
//

import Foundation
import Combine

class UniversityViewModel {
    @Published private(set) var universities:[Universities] = []
    
    var anyCancellable:AnyCancellable?
        
    var numberOfUniversities:Int = 0
    
    private var network: Networking
    
    init(network: Networking) {
        self.network = network
    }
    
    func getUniversities(url: String) {
        
        let futurePublisher = network.getUni(urlString: url, type: Universities.self)
        
        anyCancellable = futurePublisher.sink {
            completion in
            print(completion)
        } receiveValue: {
            universities in
            self.universities = universities
            self.numberOfUniversities = self.universities.count
        }
    }
    
    func getAUniversity(index: Int) -> Universities {
        if index < 0 {
            return universities[0]
        }
        if index > 345 {
            return universities[345]
        }
        return universities[index]
    }
    
    deinit {
        anyCancellable?.cancel()
    }
}
