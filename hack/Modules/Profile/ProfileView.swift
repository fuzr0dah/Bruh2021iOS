//
//  ProfileView.swift
//  hack
//
//  Created by Артём Поляничев on 04.12.2021.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        Form {
            HStack {
                Image(systemName: "person.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                
                SwiftUI.Text("Никита")
                    .font(.title)
                    .foregroundColor(.black)
            }.frame(height: 80.0)
            
            Section {
                Label("Основные", systemImage: "house.fill")
                Label("Оповещения", systemImage: "bell.circle")
            }
            
            Section {
                Label("Внешний вид", systemImage: "eyedropper.halffull")
                Label("Язык", systemImage: "globe")
            }

            Section {
                Label("Помощь", systemImage: "book.circle")
                Label("Задать вопрос", systemImage: "bubble.left.and.bubble.right")
            }
        }
    }
}
