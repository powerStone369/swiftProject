//
//  DescriptionView.swift
//  Bullseye
//
//  Created by User on 2021/11/05.
//

import SwiftUI

struct DescriptionView: View {
    @Binding var descriptionIsShowing: Bool
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 10.0) {
                DesHeaderView(descriptionIsShowing: $descriptionIsShowing)
                DesLabelView()
                
                InstructionText(text: "\n\n\n화면에 표시된 숫자에")
                    .padding(.leading, 30.0)
                    .padding(.trailing, 30.0)
                InstructionText(text: "최대한 근접하게 슬라이드를")
                    .padding(.leading, 30.0)
                    .padding(.trailing, 30.0)
                InstructionText(text: "움직이면 되는 간단한 게임입니다.")
                    .padding(.leading, 30.0)
                    .padding(.trailing, 30.0)
                
                InstructionText(text: "\n 3라운드가 한 세트로 진행되고,")
                    .padding(.leading, 30.0)
                    .padding(.trailing, 30.0)
                InstructionText(text: "해당 세트의 평균점수가 리더보드에 기록됩니다.")
                    .padding(.leading, 30.0)
                    .padding(.trailing, 30.0)
            
                InstructionText(text: "\n 그럼 행운을 빌겠습니다!")
                    .padding(.leading, 30.0)
                    .padding(.trailing, 30.0)
 
                ScrollView {
                    VStack(spacing: 10.0) {
                   
                    }
                }
            }
        }
    }
}

struct DesHeaderView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Binding var descriptionIsShowing: Bool
    
    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "BullesEye").padding(.leading)
                    Spacer()
                } else {
                    BigBoldText(text: "BullesEye")
                }
            }
            HStack {
                Spacer()
                Button(action: {
                    descriptionIsShowing = false
                }) {
                    RoundedImageViewStroked(systemName: "xmark")
                        .padding(.trailing)
                }
            }
        }
    }
}
struct DesLabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
      
            Spacer()
      
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(descriptionIsShowing: Binding.constant(true))
    }
}

