import SwiftUI
import SDWebImageSwiftUI

struct ProductCell: View {
    @State var pObj: ProductModel = ProductModel(dict: [
        "prod_id": 6,
        "cat_id": 1,
        "brand_id": 1,
        "type_id": 1,
        "name": "Red Apple",
        "detail": "Apples contain key nutrients, including fiber and antioxidants. They may offer health benefits, including lowering blood sugar levels and benefitting heart health.",
        "unit_name": "kg",
        "unit_value": "1",
        "nutrition_weight": "182g",
        "price": 1.99,
        "image": "http://localhost:3001/img/product/202307310951365136W6nJvPCdzQ.png",
        "cat_name": "Frash Fruits & Vegetable",
        "type_name": "Pulses",
        "is_fav": 1,
        "avg_rating": 0
    ])
    var didAddCart: (() -> Void)?
    
    var body: some View {
        VStack{
            WebImage(url: URL(string: pObj.image))
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 120, height: 80)
                
  
            Text(pObj.name)
                .font(.customfont(.bold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .padding(.top, 10)
            
            Text("\(pObj.unitValue)\(pObj.unitName), price")
                .font(.customfont(.medium, fontSize: 14))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondaryText)
                .padding(.leading)
                .padding(.bottom,10)
            
            
            HStack{
                Text("$\(pObj.offerPrice ?? pObj.price, specifier: "%.2f" )")
                    .font(.customfont(.semibold, fontSize: 18))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                
                Button {
                    didAddCart?()
                } label: {
                    Image("add_btn")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                }
                .frame(width: 40, height: 40)
                .background( Color.primaryApp)
                .cornerRadius(15)
                .padding(.trailing,10)
                
            }
            
        }
        .frame(width: 180, height: 230)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.placeholder.opacity(0.5), lineWidth: 1))
    }
}

#Preview {
    ProductCell()
}
