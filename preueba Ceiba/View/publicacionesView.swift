//
//  publicacionesView.swift
//  preueba Ceiba
//
//  Created by Jesus Grimaldo on 17/09/22.
//

import SwiftUI

struct publicacionesView: View {
    
    @StateObject var json1 = postsViewModel()
    
    var body: some View {
        if json1.datosPosts.isEmpty{
            ProgressView()
        }else {
            List(json1.datosPosts,id:\.id){ value in
                VStack{
                    Text("su id es \(value.title)")
                    Text(value.title)
                        .font(.title)
                        .padding()
                    Text(value.body)
                        .font(.title2)
                   
                }
            }
        }
    }
}

struct publicacionesView_Previews: PreviewProvider {
    static var previews: some View {
        publicacionesView()
    }
}
