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
var questionsQuizz : [Question] = [
    Question(topic: "Quels éléments peuvent être utilisés dans la gamification ?", number: 1, points: 50, proposition1: "Licornes, arc-en-ciel et fées",  proposition2: "Badges, points, classements et récompenses", proposition3: "La force de la pensée positive et des câlins gratuis", proposition4: "KitKat et café",validProposition: 2),
    Question(topic: "Quel est le principal avantage de la gamification?",number: 2, points: 60, proposition1: "Elle rend les tâches fastidieuses plus engageantes et amusantes", proposition2: "Elle rend les lundis matins moins redoutables", proposition3: "Elle permet de vous sentir comme un héros de jeu vidéo dans la vraie vie", proposition4: "Elle donne une excuse pour utiliser des gifs de chats dans vos e-mails", validProposition: 1),
    Question(topic: "Qu'est ce que la gamlification",number: 3, points: 70, proposition1: "un nouveau jeu vidéo sur les moutons cosmiques", proposition2: "Une technique pour rendre les réunions ennuyeuses plus amusantes", proposition3: "L'art de transformer des tâches ennuyeuses en aventures excitantes", proposition4: "Une competition pour savoir qui mange le plus de pizza en 1 heure", validProposition: 3),
    Question(topic: "Qu'est-ce qui peut vous aider à atteindre vos objectifs de gamification",number: 4, points: 80, proposition1: "Un café magique qui vous donne +10 en motivation chaque heure", proposition2: "Ajoutes des points, de la personnalisation, des challenges", proposition3: "Devenir photographe et choisir ses objetifs", proposition4: "La reponse D", validProposition: 2),
    Question(topic: "Pourquoi la gamification est efficace dans l'apprentissage ?",number: 5, points: 90, proposition1: "Les etudiants sont secrètement des ninjas affamés de connaissances", proposition2: "Elle transforme l'apprentissage en une aventure captivante et interactive", proposition3: "Elle donne une excuse pour porter des costumes excentriques", proposition4: "Les cerveaux des étudiants adorent les explosions de confettis numériques", validProposition: 2),
    Question(topic: "Depuis quand existe le principe de gamification ?",number: 6, points: 90, proposition1: "Depuis la nuit des temps (environ", proposition2: "en -2600 avant JC", proposition3: "En 1850 durant la révolution industrielle", proposition4: "Juin 1996 et l'étude de Richard Bartle", validProposition: 4),
    Question(topic: "Qu'est-ce qu'une bonne gamification ?",number: 7, points: 90, proposition1: "C'est une gamification, elle est là, elle gamifie", proposition2: "C'est une gamification, elle est là, elle gamifie, mais c'est pas pareil", proposition3: "Quand elle vous motive sans que l'on s'en rende compte", proposition4: "Vous savez, moi je ne crois pas qu'il y ait de bonne ou de mauvaise gamification. Moi si je devais resumer ma vie aujourd'hui avec vous, je dirais que c'est d'abord des rencontres", validProposition: 3),
    Question(topic: "La gamification est-elle forcement digitale ?",number: 8, points: 90, proposition1: "oui, car tout est digital, bous vivons dans la Matrice", proposition2: "non car en français digitale veut juste dire doigt", proposition3: "non mais un peu quand-même on va pas se le cacher", proposition4: "Non car elle peut s'appliquer dans tous les domains du quotidien", validProposition: 4)
]

//liste des Quizz
var quizz : Quizz = Quizz(name : "Gamificaquizz !", questions: questionsQuizz)
