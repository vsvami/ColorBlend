//
//  StorageManager.swift
//  ColorBlend
//
//  Created by Vladimir Dmitriev on 26.05.24.
//

class StorageManager {
    static let shared = StorageManager()
    
    let colors: [Color] = [
        Color(enName: "Black", ruName: "Черный", color: .black),
        Color(enName: "White", ruName: "Белый", color: .white),
        Color(enName: "Red", ruName: "Красный", color: .red),
        Color(enName: "Green", ruName: "Зеленый", color: .green),
        Color(enName: "Blue", ruName: "Синий", color: .blue),
        Color(enName: "Yellow", ruName: "Желтый", color: .yellow),
        Color(enName: "Orange", ruName: "Оранжевый", color: .orange),
        Color(enName: "Purple", ruName: "Фиолетовый", color: .purple),
        Color(enName: "Brown", ruName: "Коричневый", color: .brown),
        Color(enName: "Gray", ruName: "Серый", color: .gray),
        Color(enName: "Cyan", ruName: "Циан", color: .cyan),
        Color(enName: "Magenta", ruName: "Маджента", color: .magenta),
        Color(enName: "Clear", ruName: "Прозрачный", color: .clear)
    ]
    
    private init() {}
}
