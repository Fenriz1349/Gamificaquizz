//
//  data.swift
//  Gamificaquizz
//
//  Created by apprenant68 on 11/03/2024.
//

import Foundation
import SwiftUI

// class d'une question
// id : indentifiant unique d'une question
// topic : intitulé de la question
// number : numero de la question
// points : nombre de point gagné si on reponds bien
// proposition1,2,3,4 : intitulé des propostions
// validProposition : numero de la bonne reponse
class Question : Identifiable{
    let id = UUID()
    let topic : String
    let number : Int
    let points : Int

    let proposition1 : String
    let proposition2 : String
    let proposition3 : String
    let proposition4 : String
    let validProposition : Int
    
    init(topic: String, number: Int, points: Int, proposition1: String, proposition2: String, proposition3: String, proposition4: String, validProposition: Int) {
        self.topic = topic
        self.number = number
        self.points = points
        self.proposition1 = proposition1
        self.proposition2 = proposition2
        self.proposition3 = proposition3
        self.proposition4 = proposition4
        self.validProposition = validProposition
    }
}
// struct d'un Quizz
// id : identrifiant unique d'un quizz
// name : le nom du Quizz
// questions : listes des id des questions du quizz
// difficulty : difficulté du quizz
// isCompleted : indique si on a bien repondu (true) ou pas (false)
// getMaxScore : fonction qui renvoie le total des points donnée par le Quizz, addition du nombre de points par question plus une bonus suivant la difficulté
class Quizz : Identifiable, ObservableObject{
    let id = UUID()
    let name : String
    var questions : [Question]
    
    init(name: String, questions: [Question]) {
        self.name = name
        self.questions = questions

        }
    func getMaxScore() -> Int{
        var compteur = 0
        questions.forEach{compteur += $0.points}
        return compteur
        }
}

// struct pour animer le bouton de validation
struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color("YellowCustom"))
            .foregroundStyle(Color(.black))
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.5 : 1)
            .animation(.easeOut(duration: 0.3), value: configuration.isPressed)
    }
}

//struc pour uniformiser le style des titres
struct TitleFontStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 32))
            .foregroundStyle(Color("YellowCustom"))
            .bold()
            .padding(.bottom,5)
    }
}

//struct pour ajouter un modifier qui rajoute un overlay gris autour d'un element
struct OverlayElement: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color("TitleColor"), lineWidth: 2))
            .foregroundStyle(Color("FontColor"))
            
    }
}
//liste de toutes questions
var questionsQuizz1 : [Question] = [
    Question(topic: "Est-ce que vous aimez les objectifs ?", number: 1, points: 50, proposition1: "oui",  proposition2: "non", proposition3: "seulement pour faire des photos", proposition4: "la réponse D",validProposition: 3),
    Question(topic: "Qu'est-ce qu'un dividende ?",number: 2, points: 60, proposition1: "une part d'entreprise", proposition2: "une partie du bénéfice", proposition3: "une aide sociale", proposition4: "aucune des 3", validProposition: 1),
    Question(topic: "l'achat d'action est-il possible à tout le monde ?",number: 3, points: 70, proposition1: "oui, mais c'est compliqué", proposition2: "non", proposition3: "oui", proposition4: "si Ayoub l'autorise", validProposition: 3),
    Question(topic: "Qu'est-ce qui influence le plus le prix ?",number: 4, points: 80, proposition1: "le gouvernement", proposition2: "les PDG des grosses entreprises", proposition3: "l'offre et la demande", proposition4: "les taxes", validProposition: 3),
    Question(topic: "Quel est le meilleur moyen de devenir riche ?",number: 5, points: 90, proposition1: "avoir un gros salaire", proposition2: "ne jamais depenser d'argent", proposition3: "il faut forcement heriter", proposition4: "utiliser Easyconomy", validProposition: 4)
]

//liste des Quizz
var quizz : Quizz = Quizz(name : "Gamificaquizz !", questions: questionsQuizz1)
