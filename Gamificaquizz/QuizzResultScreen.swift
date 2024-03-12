//
//  QuizzResultScreen.swift
//  EasyconomyApp
//
//  Created by apprenant51 on 01/02/2024.
//

import SwiftUI

struct QuizzResultScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var nbGoodAnswers : Int
    @Binding var nbPointEarned : Int
    @Binding var currentQuestion : Int
    var body: some View {
        NavigationStack{
            VStack {
                Text( "Vous avez \(nbGoodAnswers)/\(questionsQuizz.count) bonnes reponses !")
                    .modifier(TitleFontStyle())
                Text("Vous avez marqué ")
                Text("\(nbPointEarned) points sur \(quizz.getMaxScore())")
                Button {
                    nbGoodAnswers = 0
                    nbPointEarned = 0
                    currentQuestion = 0
                    presentationMode.wrappedValue.dismiss()
                    }label:{HStack{
                        Image(systemName: "chevron.backward")
                        Text("Retour")
                        .font(.system(size: 25))
                        }
                    }
                .buttonStyle(GrowingButton())
            }.padding(50)
                .foregroundStyle(Color("FontColor"))
                .font(.system(size: 30))
                .modifier(OverlayElement())
        }
    }
}

#Preview {
    QuizzResultScreen(nbGoodAnswers: .constant(0), nbPointEarned: .constant(0),currentQuestion: .constant(0))
}
