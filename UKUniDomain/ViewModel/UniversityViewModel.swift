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
    
    var numberOfUniversities:Int {
        return universities.count
    }
    
    private let networkManager = NetworkManager()
    
    func getUniversities() {
        let url = "http://universities.hipolabs.com/search?country=United+Kingdom"
        
        let futurePublisher = networkManager.getUni(urlString: url, type: Universities.self)
        
        anyCancellable = futurePublisher.sink { completion in
            print(completion)
        } receiveValue: { universities in
            self.universities = universities
        }
    }
    
    func getAUniversity(index: Int) -> Universities {
        return universities[index]
    }
    
    deinit {
        anyCancellable?.cancel()
    }
}
