//
//  BackgroundView.swift
//  Bullseye
//


import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        
    }
}


/// 버튼 위치, 상호작용 /////
struct TopView: View {
    @Binding var game: Game
    @State var leaderboardIsShowing = false
    @State var descriptionIsShowing = false
    
    var body: some View {
        HStack {
            
            Button(action: {
                leaderboardIsShowing = true
            }) {
                RoundedImageViewStroked(systemName: "list.number")
            }
            .sheet(isPresented: $leaderboardIsShowing) {} content: {
                LeaderboardView(leaderboardIsShowing: $leaderboardIsShowing, game: $game)
            }
            
            Spacer()
            
            Button(action: {
                descriptionIsShowing = true
            }) {
                RoundedImageViewStroked(systemName: "questionmark")
            }.sheet(isPresented: $descriptionIsShowing) {} content: {
                DescriptionView(descriptionIsShowing: $descriptionIsShowing)
            }
            
//            Spacer()
            Button(action: {
                game.restart()
            }) {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }

        }
    }
}

struct NumberView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack(spacing: 5.0) {
            LabelText(text: title.uppercased())
            RoundRectTextView(text: text)
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            NumberView(title: "평균점수", text: String(game.averageScore))
            Spacer()
            NumberView(title: "라운드", text: String(game.round))
        }
    }
}

struct RingsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            ForEach(1..<5) { ring in
                let size = CGFloat(ring * 100)
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(
                        RadialGradient(gradient:
                                        Gradient(
                                        colors:
                                        [
                                            Color("RingsColor").opacity(opacity * 0.8),
                                            Color("RingsColor").opacity(0.0)
                                        ]),
                                       center: .center,
                                       startRadius: 100.0,
                                       endRadius: 300.0)
                    )
                    .frame(width: size, height: size)
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
