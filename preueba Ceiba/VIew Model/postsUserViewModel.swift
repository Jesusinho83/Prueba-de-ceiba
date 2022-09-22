//
//  postsUserViewModel.swift
//  preueba Ceiba
//
//  Created by Jesus Grimaldo on 18/09/22.
//

import Foundation


class postsUserViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var body = ""
    @Published var userID: Int = 0
    @Published var id: Int = 0
    
    func fetch(id:Int) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(id)") else { return  }
        
        URLSession.shared.dataTask(with: url) {data,_,_ in
            
            guard let data = data else { return }
            do{
                let json = try JSONDecoder().decode(Posts1.self, from: data)
                DispatchQueue.main.async {
                    self.title = json.datas.title
                    self.body = json.datas.body
                    self.userID = json.datas.userID
                    self.id = json.datas.id
                }
                
            }catch let error as NSError{
                print("Error en el Json", error.localizedDescription)
            }
            
        }.resume()
        
    }
}
