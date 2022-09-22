//
//  menuView.swift
//  preueba Ceiba
//
//  Created by Jesus Grimaldo on 15/09/22.
//

import SwiftUI

struct menuView: View {
    
    @StateObject var json = modeloViewModel()
    
    
    @State private var serchText: String = ""
    
    @State private var show = false
    @State private var buton = false
    
    
    

    var body: some View {
        NavigationView{
            
            if json.datosModelo.isEmpty{
                ProgressView()
            }else {
                List(json.datosModelo.filter{serchText.isEmpty ? true : $0.name.contains(serchText)},id:\.name
                     
                ){ item in
                   
                        VStack(alignment: .leading){
                            
                            HStack{
                                Image(systemName: "person.circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 30, weight: .bold))
                                Text(item.name)
                                    .font(.title).padding(.trailing).padding(.trailing).padding(.trailing)
                            }
                            
                            HStack{
                                Image(systemName: "envelope.fill")
                                    .foregroundColor(.red)
                                    .font(.system(size: 15, weight: .bold))
                                Text(item.email)
                                    .font(.footnote)
                                    .padding(.trailing)
                            }
                            HStack{
                                Image(systemName: "phone.circle.fill")
                                    .foregroundColor(.green)
                                    .font(.system(size: 15, weight: .bold))
                                
                                Text(item.phone)
                                    .font(.footnote)
                                    .padding(.trailing)
                            }
                            
                            NavigationLink(destination: postsView(id: item.id, name: item.name, email: item.email, phone: item.phone)) {
                                
                                Text("Ver Publicaciones").padding(.leading).padding(.leading).padding(.leading).padding(.leading).padding(.leading).padding(.leading).padding(.leading)
                                
                            }
                            
                            
                            .padding().buttonStyle(.bordered)
                            .tint(.blue)
                            
                            
                            
                            
                        }.padding(.trailing)
                            .navigationBarTitle("Prueba de ingreso")
                            .listStyle(.plain)
                            .searchable(text: $serchText, placement: .navigationBarDrawer(displayMode: .always),  prompt: "Search for name")
                            
                    
                    }
                    
                }
            }
        
        }
        
    

}
 
struct menuView_Previews: PreviewProvider {
    static var previews: some View {
        menuView()
    }
}
