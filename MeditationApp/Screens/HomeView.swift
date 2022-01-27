//
//  HomeView.swift
//  MeditationApp
//
//  Created by Егор Шереметов on 30.11.2021.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - PROPERTY
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    @State private var isAnimated: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        VStack(spacing: 20 ) {
            // MARK: - HEADER
            Spacer()
            
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimated ? 35 : -35)
                    .animation(.easeOut(duration: 4).repeatForever(), value: isAnimated)
            }
            
            // MARK: - CENTER
            
            Text("The time that leads to mastery is depend on the intensity of our focus")
                .font(.title3)
                .foregroundColor(.secondary)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .padding()
            
            // MARK: - FOOTER
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        } //: VSTASK
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimated = true
            })
        })
    }
}

// MARK: - PREVIEW

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
