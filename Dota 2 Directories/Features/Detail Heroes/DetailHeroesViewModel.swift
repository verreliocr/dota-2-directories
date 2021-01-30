//
//  DetailHeroesViewModel.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 31/01/21.
//

import Foundation

class DetailHeroesViewModel {
    var detailHeroes: HeroesModel
    var recommendation: [HeroesModel]
    
    init(detail: HeroesModel, recommendation: [HeroesModel]) {
        self.detailHeroes = detail
        self.recommendation = recommendation
    }
}
