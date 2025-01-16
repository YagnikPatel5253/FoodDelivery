import Foundation

struct CountryModel: Identifiable {
    let id = UUID()
    let name: String
    let flag: String
    let code: String
    let phoneCode: String
} 