//
//  ForgotPassword.swift
//  Mcoffee
//
//  Created by Devendra Kumar on 12/05/26.
//



import SwiftUI


struct ForgotPassword:View {
    
    @Environment(\.dismiss ) var dismiss
    var body: some View {
        VStack{
            HStack{
                Button{
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(Color.black)
                        .frame(width: 24, height: 24)
                        .padding(.horizontal, 30)
                    
                    
                }
                
                
                Spacer()
            }
            .padding(.top, 45)
            
            VStack(spacing: 25){
                Text("Forgot Password?")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Enter your email address")
                    .font(.custom("", size: 14))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.gray)
            }
            .padding(.top, 50)
            .padding(.leading, 50)
            
            VStack{
             
                
               
                VStack{
                    HStack{
                        Image(systemName: "envelope")
//                            .font(.title3)
                        Rectangle()
                            .frame(width: 2, height: 25)
                            .foregroundColor(.gray)
                        
                        TextField("Email address", text: .constant(""))
                       
                    }
                    Divider()
                        .padding(.vertical, 3)
                        .foregroundStyle(.gray)
                        .padding(.horizontal, -15)
                    
                }
                .padding(.top, 20)
        
            }
            .padding(.top, 48)
            .padding(.horizontal, 50)
            
            
            Spacer()
            
            HStack{
                Spacer()
                Button{
                    print("Tappeed")
                }label: {
                    Image(systemName: "arrow.forward.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(Color(red: 50/255, green: 74/255, blue: 89/255))
                        .frame(width: 64, height: 64)
                        .padding(.trailing, 30)
                }
            }
            Spacer()
        }
    }
}



#Preview {
    ForgotPassword()
}
