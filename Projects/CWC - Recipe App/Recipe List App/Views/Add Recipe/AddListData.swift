//
//  AddListData.swift
//  Recipe List App
//
//  Created by Christopher Ching on 2021-06-22.
//

import SwiftUI

struct AddListData: View {
    
    @Binding var list: [String]
    
    @State private var item: String = ""
    
    var title: String
    var placeholderText: String
    
    var body: some View {
        
        VStack (alignment: .leading) {
            
            HStack {
                Text("\(title):")
                    .bold()
                
                TextField(placeholderText, text: $item)
                
                Button("Add") {
                    // Add the item to the list
                    if item.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                        
                        // Add the item to the list
                        list.append(item.trimmingCharacters(in: .whitespacesAndNewlines))
                        
                        // Clear the text field
                        item = ""
                    }
                }
            }
            
            // List out the items added so far
            ForEach(list, id: \.self) { item in
                Text(item)
            }
            
        }
        
    }
}
