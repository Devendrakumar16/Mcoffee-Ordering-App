//
//  Registration.swift
//  Mcoffee
//
//  Created by Devendra Kumar on 12/05/26.
//


import SwiftUI


struct Registration: View{
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Button {
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
                    Text("Sign up")
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Create an account here")
                        .font(.custom("", size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.gray)
                }
                .padding(.top, 50)
                .padding(.leading, 50)
                
                VStack{
                    VStack{
                        HStack{
                            Image(systemName: "person")
                            Rectangle()
                                .frame(width: 2, height: 25)
                                .foregroundColor(.gray)
                            
                            TextField("Name", text: .constant(""))
                        }
                        Divider()
                            .padding(.vertical, 3)
                            .foregroundStyle(.gray)
                            .padding(.horizontal, -15)
                    }
                    VStack{
                        HStack{
                            Image(systemName: "iphone.gen2")
                                .font(.title3)
                            Rectangle()
                                .frame(width: 2, height: 25)
                                .foregroundColor(.gray)
                            
                            TextField("Mobile number", text: .constant(""))
                            
                        }
                        Divider()
                            .padding(.vertical, 3)
                            .foregroundStyle(.gray)
                            .padding(.horizontal, -15)
                        
                    }
                    .padding(.top, 20)
                    VStack{
                        HStack{
                            Image(systemName: "envelope")
                            //                            .font(.title3)
                            Rectangle()
                                .frame(width: 2, height: 25)
                                .foregroundColor(.gray)
                            
                            TextField("Email address", text: $viewModel.email)
                            
                        }
                        Divider()
                            .padding(.vertical, 3)
                            .foregroundStyle(.gray)
                            .padding(.horizontal, -15)
                        
                    }
                    .padding(.top, 20)
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
                    .padding(.top, 20)
                }
                .padding(.top, 48)
                .padding(.horizontal, 50)
                
                Text("By signing up you agree with our Terms of Use")
                    .font(.caption)
                    .padding(.top, 24)
                    .foregroundStyle(Color(red: 50/255, green: 74/255, blue: 89/255))
                
                
                Spacer()
                
                HStack{
                    Spacer()
                    Button{
                        Task{
                            await viewModel.signUp()
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
                    Button("Sign up"){
                        
                    }
                    .padding(.leading, -3)
                    .foregroundStyle(Color(red: 50/255, green: 74/255, blue: 89/255))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(42)
            }
        }
    }
}



#Preview {
    Registration()
}
