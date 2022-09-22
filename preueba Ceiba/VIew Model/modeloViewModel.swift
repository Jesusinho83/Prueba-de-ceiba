//
//  modeloViewModel.swift
//  preueba Ceiba
//
//  Created by Jesus Grimaldo on 15/09/22.
//

import Foundation

class modeloViewModel: ObservableObject{
    
    
    @Published var  datosModelo : [modelo] = []
    
    
    
    
        
    init() {
        fetch()
    }
    
    
    func fetch() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return  }
        
        URLSession.shared.dataTask(with: url) {data,_,_ in
            
            guard let data = data else { return }
            do{
                let json = try JSONDecoder().decode([modelo].self, from: data)
                DispatchQueue.main.async {
                    self.datosModelo = json
                }
                
            }catch let error as NSError{
                print("Error en el Json", error.localizedDescription)
            }
            
        }.resume()
        
    }
    
}
