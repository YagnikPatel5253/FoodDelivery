import SwiftUI

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

// Preview
struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            TabButton(title: "Shop", icon: "storefront", isSelect: true) {
                print("Shop tapped")
            }
        }
        .padding()
    }
}
