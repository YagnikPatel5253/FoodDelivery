import SwiftUI

struct SectionTitleAll: View {
    var title: String
    var titleAction: () -> Void
    
    var body: some View {
        HStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 20))
                .foregroundColor(.black)
            
            Spacer()
            
            Button {
                titleAction()
            } label: {
                Text("See all")
                    .font(.customfont(.medium, fontSize: 16))
                    .foregroundColor(.primaryApp)
            }
        }
        .padding(.horizontal)
    }
}

// Preview
struct SectionTitleAll_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SectionTitleAll(title: "Exclusive Offer") {
            }
            
        }
    }
} 
