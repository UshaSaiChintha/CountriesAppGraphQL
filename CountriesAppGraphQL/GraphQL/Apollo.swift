//
//  Apollo.swift
//  CountriesAppGraphQL
//
//  Created by Usha Sai Chintha on 08/06/23.
//

import Foundation
import Apollo

class Network {
    
    static let shared = Network()
    lazy var apollo = ApolloClient(url: URL(string: "https://countries.trevorblades.com/")!)
    
    private init() { }
    
}
