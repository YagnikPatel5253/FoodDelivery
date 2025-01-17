import SwiftUI

struct CountryPickerView: View {
    @Binding var selectedCountry: Country
    @State private var searchText = ""
    @Environment(\.dismiss) private var dismiss
    
    var filteredCountries: [Country] {
        if searchText.isEmpty {
            // Put India first, then sort the rest
            let india = Country.allCases.first { $0.name == "India" }
            let otherCountries = Country.allCases.filter { $0.name != "India" }
            if let india = india {
                return [india] + otherCountries
            }
            return Array(Country.allCases)
        } else {
            return Country.allCases.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        VStack {
            // Country List
            List(filteredCountries, id: \.self) { country in
                Button(action: {
                    selectedCountry = country
                    dismiss()
                }) {
                    HStack {
                        Text(country.flag)
                        Text(country.name)
                            .foregroundColor(.black)
                        Spacer()
                        Text(country.dialCode)
                            .foregroundColor(.gray)
                    }
                }
                // Highlight background for India
                .listRowBackground(country.name == "India" ? Color.green.opacity(0.1) : Color.clear)
            }
        }
        .searchable(text: $searchText, prompt: "Search country")
    }
}
