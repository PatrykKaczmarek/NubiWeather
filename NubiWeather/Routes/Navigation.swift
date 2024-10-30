//
//  Navigation.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

protocol Navigation {
    func push(_ element: NavigationDestination)
    func pop()
    func route(to element: NavigationDestination)
}
