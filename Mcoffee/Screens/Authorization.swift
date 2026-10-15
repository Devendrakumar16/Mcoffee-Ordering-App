//
//  Authorization.swift
//  Mcoffee
//
//  Created by Devendra Kumar on 12/05/26.
//

import SwiftUI


struct Authorization:View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack{
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
                        
                        VStack(spacing: 25){
                            Text("Sign In")
                                .font(.title2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("Welcome Back")
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
                                    Rectangle()
                                        .frame(width: 2, height: 25)
                                        .foregroundColor(.gray)
                                    
                                    TextField("Email address", text: $viewModel.email)
                                        .keyboardType(.emailAddress)
                                }
                                Divider()
                                    .padding(.vertical, 3)
                                    .foregroundStyle(.gray)
                                    .padding(.horizontal, -15)
                            }
                            VStack{
                                HStack{
                                    Image(systemName: "lock")
                                        .font(.title3)
                                    Rectangle()
                                        .frame(width: 2, height: 25)
                                        .foregroundColor(.gray)
                                    
                                    TextField("Password", text: $viewModel.password)
                                    Button{
                                        
                                    } label: {
                                        Image(systemName: "eye")
                                            .foregroundStyle(.black)
                                    }
                                }
                                Divider()
                                    .padding(.vertical, 3)
                                    .foregroundStyle(.gray)
                                    .padding(.horizontal, -15)
                            }
                            .padding(.top, 35)
                        }
                        .padding(.top, 54)
                        .padding(.horizontal, 50)
                        
                        NavigationLink("Forgot Password?"){
                            
                            ForgotPassword()
                                .navigationBarBackButtonHidden()
                        }
                        
                        .padding(.top, 31)
                        .foregroundStyle(.black)
                        .underline()
                        
                        Spacer()
                        
                        HStack{
                            Spacer()
                            
                            Button{
                                Task{
                                    await viewModel.login()
                                }
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
                        
                        HStack{
                            Text("New Member?")
                                .foregroundStyle(.gray)
                            NavigationLink("Sign up"){
                                
                                Registration()
                                    .navigationBarBackButtonHidden()
                            }
                            .padding(.leading, -3)
                            .foregroundStyle(Color(red: 50/255, green: 74/255, blue: 89/255))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(42)
                    }
                    .padding(.top, 27)
                    
                }
            }
        }
    }
}



#Preview {
    Authorization()
}
