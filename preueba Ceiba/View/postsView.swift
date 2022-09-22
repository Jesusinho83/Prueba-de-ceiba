//
//  postsView.swift
//  preueba Ceiba
//
//  Created by Jesus Grimaldo on 17/09/22.
//

import SwiftUI

struct postsView: View {
    
    @State var id : Int
    @State var name : String
    @State var email: String
    @State var phone: String
    @StateObject var json1 = postsViewModel()
    @StateObject var json2 = postsUserViewModel()
    
    
    var body: some View {
        
        VStack{
            VStack(alignment: .leading){
            HStack{
                Image(systemName: "person.circle.fill")
                   
                    .foregroundColor(.blue)
                    .font(.system(size: 20, weight: .bold))
                Text(name)
                    .font(.title).padding(.trailing).padding(.trailing).padding(.trailing).padding(.trailing).padding(.trailing)
            }
            
            HStack{
                Image(systemName: "envelope.fill")
                    .foregroundColor(.red)
                    .font(.system(size: 15, weight: .bold))
                Text(email)
                    .font(.footnote)
                    .padding(.trailing)
            }
            HStack{
                Image(systemName: "phone.circle.fill")
                    .foregroundColor(.green)
                    .font(.system(size: 15, weight: .bold))
                
                Text(phone)
                    .font(.footnote)
                    .padding(.trailing)
            }
        }
            
            
            
            if json1.datosPosts.isEmpty{
                ProgressView()
            }else {
                List(json1.datosPosts,  id:\.userID){ value in
                    if (self.id) == (value.userID) {
                            VStack(alignment: .leading){
                                Text(value.title).font(.title).foregroundColor(.blue)
                                    .padding()
                                Text(value.body).font(.subheadline).foregroundColor(.black)
                            }
                        }
                     }
                  }
                }
            }
            
       }
    

         
         
        
        
    
    
    
    



    

