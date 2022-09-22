//
//  Search.swift
//  preueba Ceiba
//
//  Created by Jesus Grimaldo on 17/09/22.
//

import Foundation


class search: ObservableObject{
    
    @Published var modelos: [modeloViewModel] = []
    
    func searchs(name: String) async{
        do{
            let modelos =  try await modelo()
        }
        
    }
}
