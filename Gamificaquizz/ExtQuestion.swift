//
//  ExtQuestion.swift
//  Gamificaquizz
//
//  Created by apprenant68 on 11/03/2024.
//

import SwiftUI

//extractview d'un element question / reponse
struct ExtQuestion : View {
    let question : Question
    @Binding var QReturn :Int
    var body: some View {
        Text("\(question.number)/5 : \(question.topic)")
        Picker("", selection: $QReturn){
            Text("A: "+question.proposition1).tag(1)
            Text("B: "+question.proposition2).tag(2)
            Text("C: "+question.proposition3).tag(3)
            Text("D: "+question.proposition4).tag(4)
        }.pickerStyle(.inline)
            .labelsHidden()
            .padding(5)
            .font(.system(size: 20))
            .foregroundStyle((Color("FontColor")))
    }
}

