import SwiftUI

class HomeViewModel: ObservableObject
{
    static let shared = HomeViewModel()

    @Published var selectTab: Int = 0
    
    private init() {}
}

