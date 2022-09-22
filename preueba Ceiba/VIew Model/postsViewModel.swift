//
//  postsViewModel.swift
//  preueba Ceiba
//
//  Created by Jesus Grimaldo on 17/09/22.
//

import Foundation


class  postsViewModel: ObservableObject{
    
    @Published var  datosPosts : [Posts] = []
    
    init() {
        fetch()
    }
    
    
    func fetch() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return  }
        
        URLSession.shared.dataTask(with: url) {data,_,_ in
            
            guard let data = data else { return }
            do{
                let json = try JSONDecoder().decode([Posts].self, from: data)
                DispatchQueue.main.async {
                    self.datosPosts = json
                }
                
            }catch let error as NSError{
                print("Error en el Json", error.localizedDescription)
            }
            
        }.resume()
        
    }
    
    
}
