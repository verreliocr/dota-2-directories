//
//  ListHeroesInteractor.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 29/01/21.
//

import Foundation

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
}
