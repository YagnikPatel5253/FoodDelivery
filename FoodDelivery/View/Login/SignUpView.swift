import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var mainVM = MainViewModel.shared;
    
    var body: some View {
        ZStack{
            Image("bottom_bg")
                .resizable()
                .scaledToFit()
                .frame(width: .screenWidth, height: .screenHeight)
            
            ScrollView{
                VStack{
                    Image("color_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .padding(.top, 100)
                    
                    Spacer()
                    
                        .padding(.bottom, 65)
                    Text("Sign Up")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 5)
                    
                    Text("Enter your credentials to continue")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 30)
                    
                    LineTextField( title: "Username", placholder: "Enter your username", txt: $mainVM.txtUsername)
                        .padding(.bottom, 30)
                    
                    LineTextField( title: "Email", placholder: "Enter your email address", txt: $mainVM.txtEmail, keyboardType: .emailAddress)
                        .padding(.bottom, 30)
                    
                    LineSecureField( title: "Password", placholder: "Enter your password", txt: $mainVM.txtPassword, isShowPassword: $mainVM.isShowPassword)
                        .padding(.bottom,8)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("By continuing you agree to our")
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(.secondaryText)
                                .padding(.top, 5)
                            Text("Terms of service")
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(.primaryApp)
                                .padding(.top, 5)
                                .padding(.leading, -3)
                        }
                        
                        HStack{
                            Text("and")
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(.secondaryText)
                                .padding(.top, 1)
                            
                            Text("Privacy Policy.")
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(.primaryApp)
                                .padding(.top, 1)
                                .padding(.leading, -3)
                        }
                        
                    }
                    .multilineTextAlignment(.leading)
                    .padding(.leading, -60)
                    .padding(.bottom, 20)
                    
                    
                    Button{
                        mainVM.serviceCallSignUp()
                    } label: {
                        Text("Get Started")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                    }
                    .background( Color.primaryApp)
                    .cornerRadius(20)
                    
                    .padding(.bottom, 10)
                    HStack{
                        Text("Already have an account?")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.primaryText)
                        
                        NavigationLink {
                            LoginView()
                        } label: {
                            Text("Sign In")
                                .font(.customfont(.semibold, fontSize: 16))
                                .foregroundColor(.primaryApp)
                        }
                        
                    }
                }
                .padding(.bottom, 190)
                .padding(.horizontal, 20)
                .padding(.bottom, .bottomInsets)
                
            }
            
            
            // Back Button
            VStack {
                HStack {
                    BackButton {
                        SignInView()
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding(.top, 60)
            .padding(.horizontal, 20)
        }
        
        // Alert
        .alert(isPresented: $mainVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(mainVM.errorMessage) , dismissButton: .default(Text("Ok")))
        })
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        SignUpView()
    }
}
