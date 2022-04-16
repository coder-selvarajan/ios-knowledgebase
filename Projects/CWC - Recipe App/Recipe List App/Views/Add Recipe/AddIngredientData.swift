//
//  AddIngredientData.swift
//  Recipe List App
//
//  Created by Christopher Ching on 2021-06-23.
//

import SwiftUI

struct AddIngredientData: View {
    
    @Binding var ingredients: [IngredientJSON]
    
    @State private var name = ""
    @State private var unit = ""
    @State private var num = ""
    @State private var denom = ""
    
    var body: some View {
        
        VStack (alignment: .leading) {
            
            Text("Ingredients:")
                .bold()
                .padding(.top, 5)
            
            HStack {
                
                TextField("Sugar", text: $name)
                
                TextField("1", text: $num)
                    .frame(width:20)
                
                Text("/")
                
                TextField("2", text: $denom)
                    .frame(width: 20)
                
                TextField("cups", text: $unit)
                
                Button("Add") {
                    
                    // Make sure that the fields are populated
                    let cleanedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
                    let cleanedNum = num.trimmingCharacters(in: .whitespacesAndNewlines)
                    let cleanedDenom = denom.trimmingCharacters(in: .whitespacesAndNewlines)
                    let cleanedUnit = unit.trimmingCharacters(in: .whitespacesAndNewlines)
                    
                    // Check that all the fields are filled in
                    if cleanedName == "" || cleanedNum == "" || cleanedDenom == "" || cleanedUnit == "" {
                        return
                    }
                    
                    // Create an IngredientJSON object and set its properties
                    let i = IngredientJSON()
                    i.id = UUID()
                    i.name = cleanedName
                    i.num = Int(cleanedNum) ?? 1
                    i.denom = Int(cleanedDenom) ?? 1
                    i.unit = cleanedUnit
                    
                    // Add this ingredient to the list
                    ingredients.append(i)
                    
                    // Clear text fields
                    name = ""
                    num = ""
                    denom = ""
                    unit = ""
                }
            }
            
            ForEach(ingredients) { ingredient in
                Text("\(ingredient.name), \(ingredient.num ?? 1)/\(ingredient.denom ?? 1) \(ingredient.unit ?? "")")
            }
        }
        
    }
}
