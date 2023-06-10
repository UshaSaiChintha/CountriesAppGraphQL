//
//  CountriesListViewModel.swift
//  CountriesAppGraphQL
//
//  Created by Usha Sai Chintha on 10/06/23.
//

import Foundation
import Apollo

struct CountryViewModel {
    
    fileprivate let country: GetAllCountriesDetailsQuery.Data.Country
    
    var code: GraphQLID {
        country.code
    }
    
    var name: String {
        country.name
    }
    
    var emoji: String {
        country.emoji
    }
    
}

extension CountryViewModel {
    
    static var defaultCountry: CountryViewModel {
        CountryViewModel(country: GetAllCountriesDetailsQuery.Data.Country(code: "US", name: "United States", emoji: "🇺🇸"))
    }
}

class CountriesListViewModel: ObservableObject {
    
    @Published var countries: [CountryViewModel] = []
    
    func getAllCountries() {
        Network.shared.apollo.fetch(query: GetAllCountriesDetailsQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                if let countries = graphQLResult.data?.countries {
                DispatchQueue.main.async {
                    self.countries = countries.map(CountryViewModel.init)
                }
            }
            case .failure(let error): print(error)
            }
        }
    }
    
}
