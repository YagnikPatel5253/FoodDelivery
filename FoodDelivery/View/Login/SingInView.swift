import SwiftUI
import CountryPicker

struct SingInView: View {
    
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
                    Divider()
                        .frame(width: 350)
                    
                    VStack{
                    
                        Text("or connnect with social media")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.textTitle)
                            .multilineTextAlignment(.center)
                            .padding(.top, 30)
                            .padding(.bottom, 35)
                        
                        Button {
                            // code
                        } label: {
                            HStack{
                                Image("google_logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .padding(.trailing, 20)
                            
                            }
                                Text("Continue with Google")
                                    .font(.customfont(.semibold, fontSize: 18))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding(.trailing, 40)
                        }
                        
                        
                        .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                        .background(Color(hex: "5383EC"))
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
                        
                        .padding(.bottom, 10)
                        
                        Button {
                    
                        } label: {
                            
                            HStack{
                                Image("fb_logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .padding(.trailing, 20)
                                
                                Text("Continue with Facebook")
                                    .font(.customfont(.semibold, fontSize: 18))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding(.trailing, 21)
                            }
                                
                        }
                        
                        .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                        .background(Color(hex: "4A6680"))
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
                    }
                    
                    
                    
                    
                }
                .padding(.top, 90)
            }
            .onAppear{
                self.countryObj = Country(phoneCode: "91", isoCode: "IN")
            }
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
    SingInView()
}
