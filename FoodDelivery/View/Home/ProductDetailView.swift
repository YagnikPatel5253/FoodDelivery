import SwiftUI

struct ProductDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var detailVM: ProductDetailViewModel = ProductDetailViewModel(prodObj: ProductModel(dict: [:]) )
    
    var body: some View {
        NavigationStack{
            ZStack{
                ScrollView{
                    ZStack{
                        Rectangle()
                            .foregroundColor(Color(hex: "F2F2F2"))
                            .frame(width: .screenWidth, height: .screenWidth * 0.8)
                            .cornerRadius(20, corner: [.bottomLeft, .bottomRight])
                    }
                }
                
                VStack{
                    HStack{
                        Button{
                            mode.wrappedValue.dismiss()
                        } label: {
                            Image("back")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 22, height: 22)
                        }
                        Spacer()
                        
                        Button{
                            mode.wrappedValue.dismiss()
                        } label: {
                            Image("share")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 22, height: 22)
                        }
                    }
                    Spacer()
                    
                }
                .padding(.top, 60)
                .padding(.horizontal, 20)
            }
            .navigationTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .ignoresSafeArea()
        }
        
        
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(detailVM: ProductDetailViewModel(prodObj: ProductModel(dict: [
            
            "offer_price": 2.49,
            "start_date": "2023-07-30T18:30:00.000Z",
            "end_date": "2023-08-29T18:30:00.000Z",
            "prod_id": 5,
            "cat_id": 1,
            "brand_id": 1,
            "type_id": 1,
            "name": "Organic Banana",
            "detail": "banana, fruit of the genus Musa, of the family Musaceae, one of the most important fruit crops of the world. The banana is grown in the tropics, and, though it is most widely consumed in those regions, it is valued worldwide for its flavour, nutritional value, and availability throughout the year",
            "unit_name": "pcs",
            "unit_value": "7",
            "nutrition_weight": "200g",
            "price": 2.99,
            "image": "http://192.168.1.3:3001/img/product/202307310947354735xuruflIucc.png",
            "cat_name": "Frash Fruits & Vegetable",
            "type_name": "Pulses",
            "is_fav": 1
            
        ])))
    }
}
