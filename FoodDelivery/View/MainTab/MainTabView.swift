import SwiftUI

struct MainTabView: View {
    
    @StateObject var homeVM = HomeViewModel.shared
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $homeVM.selectTab) {
                HomeView()
                    .tag(0)
                ExploreView()
                    .tag(1)
                MyCartView()
                    .tag(2)
                FavouriteView()
                    .tag(3)
                AccountView()
                    .tag(4)
            }
            .ignoresSafeArea(.all, edges: .bottom)
            
            // Custom Tab Bar
            HStack {
                TabButton(title: "Shop", icon: "storefront", isSelect: homeVM.selectTab == 0) {
                    homeVM.selectTab = 0
                }
                
                TabButton(title: "Explore", icon: "magnifyingglass", isSelect: homeVM.selectTab == 1) {
                    homeVM.selectTab = 1
                }
                
                TabButton(title: "Cart", icon: "cart", isSelect: homeVM.selectTab == 2) {
                    homeVM.selectTab = 2
                }
                
                TabButton(title: "Favourite", icon: "heart", isSelect: homeVM.selectTab == 3) {
                    homeVM.selectTab = 3
                }
                
                TabButton(title: "Account", icon: "person", isSelect: homeVM.selectTab == 4) {
                    homeVM.selectTab = 4
                }
            }
            .padding(.top, 10)
            .padding(.bottom,30)
            .padding(.horizontal, 10)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: -2)
//            .padding(.horizontal)
//            .padding(.bottom, 8)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
        
    }
}

// TabButton Component
struct TabButton: View {
    var title: String
    var icon: String
    var isSelect: Bool
    var didSelect: (() -> Void)
    
    var body: some View {
        Button {
            withAnimation(.easeInOut) {
                didSelect()
            }
        } label: {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 22))
                    .environment(\.symbolVariants, isSelect ? .fill : .none)
                    .foregroundColor(isSelect ? .primaryApp : .black)
                
                Text(title)
                    .font(.customfont(.semibold, fontSize: 12))
                    .foregroundColor(isSelect ? .primaryApp : .black)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainTabView()
        }
        
    }
}
