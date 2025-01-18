import SwiftUI

struct SearchTextField: View {
    @Binding var searchText: String
    var placeholder: String = "Search"
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 22))
                .foregroundColor(.black)
            
            TextField(placeholder, text: $searchText)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.black)
                .autocorrectionDisabled()
                .autocapitalization(.none)
            
            if !searchText.isEmpty {
                Button {
                    searchText = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.gray.opacity(0.1))
        )
    }
}

// Usage Example:
struct SearchTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SearchTextField(searchText: .constant(""))
                .padding()
            
//            SearchTextField(searchText: .constant("Test"), placeholder: "Search products")
//                .padding()
        }
    }
} 
