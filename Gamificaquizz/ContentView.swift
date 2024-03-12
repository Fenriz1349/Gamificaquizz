//
//  ContentView.swift
//  Gamificaquizz
//
//  Created by apprenant68 on 11/03/2024.
//

import SwiftUI

struct ContentView: View {
    //    variables pour stocker la reponse selctionner
    @State var questionReturn : [Int] = Array(repeating: 0, count: questionsQuizz.count)
    @State var nbGoodAnswers : Int = 0
    @State var currentQuestion : Int = 0
    @State var nbPointEarned : Int = 0
    @State private var showingModalQuizz = false
    
    var body: some View {
        ZStack{
            Color(Color("BckgroundColor"))
                .ignoresSafeArea()
            NavigationStack{
                VStack{
                    Text(quizz.name)
                        .modifier(TitleFontStyle())
                    Form{
                        ExtQuestion(question: quizz.questions[currentQuestion], QReturn: $questionReturn[currentQuestion])
                            .padding(5)
                    }
                    HStack{
                        Button(){
                            if quizz.questions[currentQuestion].validProposition.contains(questionReturn[currentQuestion]) {
                                nbGoodAnswers+=1
                                nbPointEarned+=quizz.questions[currentQuestion].points
                            }
                            currentQuestion<questionsQuizz.count-1 ? currentQuestion+=1 : showingModalQuizz.toggle()
                            
                        }
                    label:{HStack{
                        Text(currentQuestion<questionsQuizz.count-1 ? "Suivant   " : "Valider")
                        Image(systemName: currentQuestion<questionsQuizz.count-1 ? "chevron.forward" : "")} }
                    .buttonStyle(GrowingButton())
                    .sheet(isPresented: $showingModalQuizz) {
                        QuizzResultScreen(nbGoodAnswers :$nbGoodAnswers, nbPointEarned: $nbPointEarned, currentQuestion: $currentQuestion)
                    }
                    }
                    Text("bonne reponses : \(nbGoodAnswers) / \(currentQuestion)")
//                    Text("vous avez marqué \(nbPointEarned)")
                }
            }
        }.padding()
            .font(.system(size: 25))
            .foregroundStyle((Color("FontColor")))
    }
}


#Preview {
    ContentView()
}

