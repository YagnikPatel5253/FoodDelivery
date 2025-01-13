import SwiftUI

struct MainTabView: View {
    @ObservedObject var mainVM: MainViewModel // Observe the ViewModel

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button {
                        mainVM.logout() // Call the logout function
                    } label: {
                        Text("Logout")
                    }
                }
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    MainTabView(mainVM: MainViewModel.shared)
}
