//
//  ListHeroesInteractor.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 29/01/21.
//

import Foundation
import Disk

class ListHeroesInteractor: IListHeroesInteractor {
    
    let request: IRequest
    
    init(request: IRequest) {
        self.request = request
    }
    
    func getListHeroes(completion: @escaping (([HeroesModel]?, ErrorType?) -> Void)) {
        request.call(.getListHeroes, bodyParams: [:]) { data, type in
            if let genreModel = [HeroesModel].decode(from: data) {
                completion(genreModel, nil)
            }else{
                completion(nil, type)
            }
        }
    }
    
    func saveHeroes(_ heroes: [HeroesModel]) {
        try? Disk.save(heroes, to: .caches, as: "heroes.json")
    }
    
    func fetchHeroes() -> [HeroesModel] {
        if Disk.exists("heroes.json", in: .caches), let data = try? Disk.retrieve("heroes.json", from: .caches, as: [HeroesModel].self) {
            return data
        }
        return []
    }
}
