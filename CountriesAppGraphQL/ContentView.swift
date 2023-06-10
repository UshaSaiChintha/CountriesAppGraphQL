//
//  ContentView.swift
//  CountriesAppGraphQL
//
//  Created by Usha Sai Chintha on 08/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var countriesListViewModel = CountriesListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(countriesListViewModel.countries, id: \.code) { country in
                    NavigationLink {
                        CountryDetailsView(country: country)
                    } label: {
                        HStack {
                            Text(country.emoji)
                            Text(country.name)
                        }
                    }
                }.listStyle(PlainListStyle())
            }
            .onAppear(perform: {
                countriesListViewModel.getAllCountries()
            })
            .navigationTitle("Countries")
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
