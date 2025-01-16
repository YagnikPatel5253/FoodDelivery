import SwiftUI
import CountryPicker

struct SignInView: View {
    
    @State var txtMobile : String = ""
    @State var isShowPicker : Bool = false
    @State var countryObj : Country?
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
                        .padding(.bottom, 20)
                    
                    HStack{
                        Button{
                            isShowPicker = true
                        } label: {
                            if let countryObj = countryObj{
                                Text("\( countryObj.isoCode.getFlag())")
                                    .font(.customfont(.medium, fontSize: 35))
                                    .padding(.leading, 25)
                                
                                Text("+\( countryObj.phoneCode )")
                                    .font(.customfont(.medium, fontSize: 18))
                                    .foregroundColor(.primaryText)
                            }
                        }
                        TextField("Enter Mobile", text: $txtMobile)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding(.trailing, 188)
                    }
                    .padding(.bottom, 15)
                    
                    
                    NavigationLink {
                        LoginView()
                    } label: {
                        Text("Continue with SignIn")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                    .background(Color(hex: "5383EC"))
                    .cornerRadius(20)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 5)
                    
                    
                    NavigationLink {
                        SignUpView()
                    } label: {
                        Text("Continue with SignUp")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                    .background(Color.primaryApp)
                    .cornerRadius(20)
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

            .onAppear{
                self.countryObj = Country(phoneCode: "91", isoCode: "IN")
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
        .sheet(isPresented: $isShowPicker, content: {
            CountryPickerUI(country: $countryObj)
        })
        
        .navigationTitle("")
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationView{
        SignInView()
    }
}
