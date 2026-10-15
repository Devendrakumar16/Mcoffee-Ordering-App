//
//  Welcome.swift
//  Mcoffee
//
//  Created by Devendra Kumar on 12/05/26.
//


import SwiftUI

struct Welcome: View {
    var body: some View {
        
        VStack{
            NavigationStack{
            Image("welcomeImage")
                .resizable()
                .frame(width: .infinity, height: 323)
                .padding(.top, 50)
                .padding(.horizontal, -2)
                

            VStack{
                
          
            Text("Feel yourself like ")
                Text("a barista!")
               
            }
            .padding(.top, 20)
            .font(.custom("Poppins-Bold", size: 28))
            
            Text("Magic coffee on order")
                .padding(.top, 1)
                .font(.title3)
                .foregroundStyle(Color.gray)
            
            HStack{
                Image(systemName: "ellipsis")
                    .font(.largeTitle)
                    .padding(.top, 10)
            }
            
                        Spacer()
            HStack{
                Spacer()
                
               
                    NavigationLink{
                        Authorization()
                            .navigationBarBackButtonHidden(true)
                    }label: {
                        Image(systemName: "arrow.forward.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(Color(red: 50/255, green: 74/255, blue: 89/255))
                            .frame(width: 64, height: 64)
                            .padding(.trailing, 30)
                    }
                }
            }
        }
        }
    }



#Preview {
    Welcome()
}
