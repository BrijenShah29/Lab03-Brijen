//
//  ViewController.swift
//  BrijenLab3
//
//  Created by Brijen Shah on 2022-11-06.
//

import Foundation
import UIKit

class FavoritesList {
    static let sharedFavoritesList = FavoritesList()
    private(set) var favorites:[String]
    
    init() {
        let defaults = UserDefaults.standard
        let storedFavorites = defaults.object(forKey: "favorites") as? [String]
        favorites = storedFavorites != nil ? storedFavorites! : []
    }
    
    func moveItem(fromIndex from: Int, toIndex to: Int) {
            let item = favorites[from]
            favorites.remove(at: from)
            favorites.insert(item, at: to)
            saveFavorites()
        }
    
    func addFavorite(fontName: String) {
        if !favorites.contains(fontName) {
            favorites.append(fontName)
            saveFavorites()
        }
    }
    
    func removeFavorite(fontName: String) {
        if let index = favorites.firstIndex(of: fontName) {
            favorites.remove(at: index)
            saveFavorites()
        }
    }
    
    private func saveFavorites() {
        let defaults = UserDefaults.standard
        let favorites = FavoritesList.sharedFavoritesList.favorites
        FavoritesList.sharedFavoritesList.favorites = []
        FavoritesList.sharedFavoritesList.favorites.append("Comic Sans MS")
        defaults.set(favorites, forKey: "favorites")
        defaults.synchronize()
    }
}
