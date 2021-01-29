//
//  HeroesModels.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 28/01/21.
//

import Foundation

struct HeroesModel: Codable {
    var id: Int?
    var localizedName: String?
    var primaryAttr: String?
    var roles: [String]?
    var img: String?
    var icon: String?
    var baseHealth: Double?
    var baseHealthRegen: Double?
    var baseMana: Double?
    var baseManaRegen: Double?
    var baseArmor: Double?
    var baseMR: Double?
    var baseAttackMin: Double?
    var baseAttackMax: Double?
    var baseStr: Double?
    var baseAgi: Double?
    var baseInt: Double?
    var attackRange: Double?
    var projectileSpeed: Double?
    var attackRate: Double?
    var moveSpeed: Double?
    var heroId: Int?
}

private extension HeroesModel {
    enum CodingKeys: String, CodingKey {
        case id, roles, img, icon
        case localizedName = "localized_name"
        case primaryAttr = "primary_attr"
        case baseHealth = "base_health"
        case baseHealthRegen = "base_health_regen"
        case baseMana = "base_mana"
        case baseManaRegen = "base_mana_regen"
        case baseArmor = "base_armor"
        case baseMR = "base_mr"
        case baseAttackMin = "base_attack_min"
        case baseAttackMax = "base_attack_max"
        case baseStr = "base_str"
        case baseAgi = "base_agi"
        case baseInt = "base_int"
        case attackRange = "attack_range"
        case projectileSpeed = "projectile_speed"
        case attackRate = "attack_rate"
        case moveSpeed = "move_speed"
        case heroId = "hero_id"
    }
}
