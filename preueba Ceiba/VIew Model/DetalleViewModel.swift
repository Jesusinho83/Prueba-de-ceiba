//
//  DetalleViewModel.swift
//  preueba Ceiba
//
//  Created by Jesus Grimaldo on 17/09/22.
//

import Foundation

class DetalleViewModel: ObservableObject{
    
    @Published var  datosPosts : [Posts] = []
    
    init() {
        fetch1()
    }
    
    func fetch1(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return  }
        
        URLSession.shared.dataTask(with: url) {data,_,_ in
            
            guard let data = data else { return }
            do{
                let json = try JSONDecoder().decode([Posts].self, from: data)
                DispatchQueue.main.async {
                    self.title = json.data.title
                    self.body = json.data.body
                    
                }
                
            }catch let error as NSError{
                print("Error en el Json", error.localizedDescription)
            }
            
        }.resume()
        
    }
}

