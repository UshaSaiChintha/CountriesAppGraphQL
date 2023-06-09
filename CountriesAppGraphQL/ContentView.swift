//
//  ContentView.swift
//  CountriesAppGraphQL
//
//  Created by Usha Sai Chintha on 08/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries: [GetAllCountriesDetailsQuery.Data.Country] = []
    
    var body: some View {
        NavigationView {
            VStack {
                List(countries, id: \.code) { country in
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
                Network.shared.apollo.fetch(query: GetAllCountriesDetailsQuery()) { result in
                    switch result {
                    case .success(let graphQLResult):
                        if let countries = graphQLResult.data?.countries {
                        DispatchQueue.main.async {
                            self.countries = countries
                        }
                    }
                    case .failure(let error): print(error)
                    }
                }
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
