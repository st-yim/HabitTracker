//
//  SplashScreenView.swift
//  HabitTracker
//
//  Created by Steven Yim on 1/14/24.
//

import SwiftUI

struct SplashScreenView: View {
    
    @Binding var isPresented: Bool
    
    @State private var scale = CGSize(width: 0.8, height: 0.8)
    @State private var systemImageOpacity = 0.0
    @State private var imageOpacity = 1.0
    
    @State private var opacity = 1.0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.orange, .yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            ZStack {
                Image(systemName: "heart.text.square.fill")
                    .font(.system(size: 50))
                    .foregroundStyle(.gray)
                    .opacity(systemImageOpacity)
            }

            .scaleEffect(scale)
        }
        .opacity(opacity)
        .onAppear {
            withAnimation(.easeInOut(duration: 1.5)) {
                scale = CGSize(width: 1, height: 1)
                systemImageOpacity = 1
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
                withAnimation(.easeIn(duration: 0.35)) {
                    scale = CGSize(width: 50, height: 50)
                    opacity = 0
                }
            })
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.9, execute: {
                withAnimation(.easeIn(duration: 0.2)) {
                    isPresented.toggle()
                }
            })
        }
    }
}

#Preview {
    SplashScreenView(isPresented: .constant(true))
}
