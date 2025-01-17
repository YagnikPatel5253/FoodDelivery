import SwiftUI
import iPhoneNumberField

struct SignInView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    @State private var phoneNumber = ""
    @State private var selectedCountry = Country.india
    @State private var showCountryPicker = false
    
    var body: some View {
        
        ZStack{
            Image("bottom_bg")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenWidth)
            
            VStack{
                Image("sign_in_top")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .screenWidth, height: .screenWidth)
                Spacer()
            }
            
            ScrollView{
                VStack{
                    Text("Get your groceries \nwith nectar")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.primaryText)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 350)
                        .padding(.trailing, 130)
                        .padding(.bottom, 25)
                    
                    HStack(spacing: 12) {
                        Button(action: {
                            showCountryPicker = true
                        }) {
                            HStack(spacing: 4) {
                                Text(selectedCountry.flag)
                                    .font(.system(size: 22))
                                Text(selectedCountry.dialCode)
                                    .font(.system(size: 18))
                                    .foregroundColor(.black)
                            }
                            .frame(width: 100)
                            .padding(.leading, -20)
                        }
                        .sheet(isPresented: $showCountryPicker) {
                            NavigationView {
                                CountryPickerView(selectedCountry: $selectedCountry)
                                    .navigationTitle("Select Country")
                                    .navigationBarTitleDisplayMode(.inline)
                            }
                        }
                        iPhoneNumberField("Enter phone number", text: $phoneNumber)
                            .flagHidden(true)
                            .flagSelectable(false)
                            .formatted(true)
                            .font(UIFont(size: 16, weight: .regular))
                    }
                    .padding(.horizontal, 24)
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray.opacity(0.3))
                        .padding(.horizontal, 30)
                        .padding(.bottom, 25)
                    
                    NavigationLink {
                        LoginView()
                    } label: {
                        Text("Continue with SignIn")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                            .background(Color(hex: "5383EC"))
                            .cornerRadius(20)
                    }
                    
                    .padding(.horizontal, 20)
                    .padding(.bottom, 5)
                    
                    
                    NavigationLink {
                        SignUpView()
                    } label: {
                        Text("Continue with SignUp")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                            .background(Color.primaryApp)
                            .cornerRadius(20)
                    }
                    
                    .padding(.horizontal, 20)
                    
                    Divider()
                        .frame(width: 350)
                    
                    
                    
                    VStack{
                        
                        Text("or connnect with social media")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.textTitle)
                            .multilineTextAlignment(.center)
                            .padding(.top, 30)
                            .padding(.bottom, 15)
                        
                        HStack{
                            
                            Image("google")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .padding(.trailing,5)
                            Image("facebook")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .padding(.trailing,5)
                            Image("apple_logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42)
                        }
                    }
                }
                .padding(.top, 50)
            }
            
            VStack{
                HStack{
                    NavigationLink{
                        WelcomeView()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding(.top, 60)
            .padding(.horizontal, 20)
            
        }
        
        .navigationTitle("")
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        SignInView()
    }
}
