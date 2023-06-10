//
//  CountryDetailsView.swift
//  CountriesAppGraphQL
//
//  Created by Usha Sai Chintha on 10/06/23.
//

import SwiftUI

struct CountryDetailsView: View {
    
    let country: CountryViewModel
    @StateObject private var countryDetailViewModel = CountryDetailViewModel()
    
    var body: some View {
        VStack{
            Text(countryDetailViewModel.name)
            Text(countryDetailViewModel.capital)
            List(countryDetailViewModel.states, id: \.id) { state in
                Text(state.name)
            }
        }.onAppear {
            countryDetailViewModel.getCountryDetailsByCode(code: country.code)
        }
    }
}

struct CountryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailsView(country: CountryViewModel.defaultCountry)
    }
}
