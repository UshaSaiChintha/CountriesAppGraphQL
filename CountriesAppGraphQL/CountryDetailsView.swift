//
//  CountryDetailsView.swift
//  CountriesAppGraphQL
//
//  Created by Usha Sai Chintha on 10/06/23.
//

import SwiftUI

struct CountryDetailsView: View {
    
    let country: GetAllCountriesDetailsQuery.Data.Country
    @State private var countryInfo: GetCountryInfoQuery.Data.Country?
    
    var body: some View {
        VStack{
            Text(countryInfo?.name ?? "")
            Text(countryInfo?.capital ?? "")
            List(countryInfo?.states ?? [], id: \.name) { state in
                Text(state.name)
            }
        }.onAppear {
            Network.shared.apollo.fetch(query: GetCountryInfoQuery(code: country.code)) { result in
                switch result {
                case .success(let graphQLResult):
                    DispatchQueue.main.async {
                        self.countryInfo = graphQLResult.data?.country
                    }
                case .failure(let error): print(error)
                }
            }
        }
    }
}

struct CountryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailsView(country: GetAllCountriesDetailsQuery.Data.Country(code: "US", name: "United States", emoji: ""))
    }
}
