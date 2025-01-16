import SwiftUI

struct TabButton: View {
    var title: String
    var icon: String
    var isSelect: Bool
    var didSelect: (() -> Void)
    
    var body: some View {
        Button {
            withAnimation {
                didSelect()
            }
        } label: {
            VStack {
                Image(icon)
                
                // For changing the img color
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundColor(isSelect ? .primaryApp : .black)
                
                Text(title)
                    .font(.customfont(.semibold, fontSize: 14))
                    .foregroundColor(isSelect ? .primaryApp : .black)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            TabButton(title: "Shop", icon: "store_tab", isSelect: true) {
            }
        }
    }
}
