import SwiftUI

struct BackButton: View {
    var destination: () -> any View
    
    var body: some View {
        NavigationLink {
            AnyView(destination())
        } label: {
            Image("back")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
        }
    }
}

// Preview
struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton {
            Text("Destination View")
        }
    }
} 
