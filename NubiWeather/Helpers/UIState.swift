//
//  UIState.swift
//  NubiWeather
//
//  Created by Patryk on 30/10/2024.
//

enum UIState<T> {
    case unknown
    case loading
    case empty
    case error
    case data(T)
}
