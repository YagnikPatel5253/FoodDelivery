import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    Image("color_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    HStack{
                        Image("location")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                        Text("Vadodara, India")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.darkGray)
                    }
                    SearchTextField(searchText: .constant(""), placeholder: "Search products")
                        .padding()
                    
                    Image("banner_top")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 15)
                        .padding(.top, -5)
                        .padding(.bottom, 15)
                    
                    SectionTitleAll(title: "Exclusive Offer"){
                    }
                    .padding(.bottom, 10)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 15) {
                            ForEach(0...5, id: \.self) { index in
                                ProductCell(didAddCart: {
                                    // Add your cart action here
                                    print("Add to cart tapped")
                                })
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 15)
                    
                    
                    SectionTitleAll(title: "Best Selling"){
                        // code
                    }
                    .padding(.bottom, 10)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 15) {
                            ForEach(0...5, id: \.self) { index in
                                ProductCell(didAddCart: {
                                    // Add your cart action here
                                    print("Add to cart tapped")
                                })
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 15)
                    SectionTitleAll(title: "Groceries"){
                        // code
                    }
                    .padding(.bottom, 10)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 15) {
                            ForEach(0...5, id: \.self) { index in
                                CategoryCell(didAddCart: {
                                    // Add your cart action here
                                    print("Add to cart tapped")
                                })
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 10)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 15) {
                            ForEach(0...5, id: \.self) { index in
                                ProductCell(didAddCart: {
                                    // Add your cart action here
                                    print("Add to cart tapped")
                                })
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
