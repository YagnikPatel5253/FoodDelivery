import SwiftUI

class HomeViewModel: ObservableObject
{
    static var shared: HomeViewModel = HomeViewModel()

    @Published var selectTab: Int = 0
    
}

