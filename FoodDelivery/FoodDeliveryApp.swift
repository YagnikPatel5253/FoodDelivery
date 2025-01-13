import SwiftUI

@main
struct FoodDeliveryApp: App {
    @StateObject var mainVM = MainViewModel.shared

    var body: some Scene {
        WindowGroup {
            NavigationView {
                if mainVM.isUserLogin {
                    MainTabView(mainVM: mainVM) // Pass the ViewModel here
                } else {
                    SingInView()
                }
            }
        }
    }
}
