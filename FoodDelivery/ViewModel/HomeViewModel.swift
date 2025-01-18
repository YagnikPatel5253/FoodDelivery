import SwiftUI

class HomeViewModel: ObservableObject
{
    static let shared = HomeViewModel()

    @Published var selectTab: Int = 0
    @Published var searchText: String = ""
    
    private init() {}
}

