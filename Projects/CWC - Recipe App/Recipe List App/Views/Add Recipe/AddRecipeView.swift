//
//  AddRecipeView.swift
//  Recipe List App
//
//  Created by Christopher Ching on 2021-06-22.
//

import SwiftUI

struct AddRecipeView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    // Tab selection
    @Binding var tabSelection: Int
    
    // Properties for recipe meta data
    @State private var name = ""
    @State private var summary = ""
    @State private var prepTime = ""
    @State private var cookTime = ""
    @State private var totalTime = ""
    @State private var servings = ""
    
    // List type recipe meta data
    @State private var highlights = [String]()
    @State private var directions = [String]()
    
    // Ingredient data
    @State private var ingredients = [IngredientJSON]()
    
    // Recipe Image
    @State private var recipeImage: UIImage?
    
    // Image Picker
    @State private var isShowingImagePicker = false
    @State private var selectedImageSource = UIImagePickerController.SourceType.photoLibrary
    @State private var placeHolderImage = Image("noImageAvailable")
    
    var body: some View {
        
        VStack {
            
            // HStack with the form controls
            HStack {
                Button("Clear") {
                    
                    // Clear the form
                    clear()
                }
                
                Spacer()
                
                Button("Add") {
                    
                    // Add the recipe to core data
                    addRecipe()
                    
                    // Clear the form
                    clear()
                    
                    // Navigate to the list
                    tabSelection = Constants.listTab
                }
            }
            
            // Scrollview
            ScrollView (showsIndicators: false) {
                
                VStack {
                    
                    // Recipe image
                    placeHolderImage
                        .resizable()
                        .scaledToFit()
                    
                    HStack {
                        Button("Photo Library") {
                            selectedImageSource = .photoLibrary
                            isShowingImagePicker = true
                        }
                        
                        Text(" | ")
                        
                        Button("Camera") {
                            selectedImageSource = .camera
                            isShowingImagePicker = true
                        }
                    }
                    .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
                        ImagePicker(selectedSource: selectedImageSource, recipeImage: $recipeImage)
                    }
                    
                    // The recipe meta data
                    AddMetaData(name: $name,
                                summary: $summary,
                                prepTime: $prepTime,
                                cookTime: $cookTime,
                                totalTime: $totalTime,
                                servings: $servings)
                    
                    // List data
                    AddListData(list: $highlights, title: "Highlights", placeholderText: "Vegetarian")
                    
                    AddListData(list: $directions, title: "Directions", placeholderText: "Add the oil to the pan")
                    
                    // Ingredient Data
                    AddIngredientData(ingredients: $ingredients)
                }
                
            }
            
        }
        .padding(.horizontal)
        
    }
    
    func loadImage() {
        
        // Check if an image was selected from the library
        if recipeImage != nil {
            // Set it as the placeholder image
            placeHolderImage = Image(uiImage: recipeImage!)
        }
    }
    
    func clear() {
        // Clear all the form fields
        name = ""
        summary = ""
        prepTime = ""
        cookTime = ""
        totalTime = ""
        servings = ""
        
        highlights = [String]()
        directions = [String]()
        
        ingredients = [IngredientJSON]()
        
        placeHolderImage = Image("noImageAvailable")
        
    }
    
    func addRecipe() {
        
        // Add the recipe into Core Data
        let recipe = Recipe(context: viewContext)
        recipe.id = UUID()
        recipe.name = name
        recipe.cookTime = cookTime
        recipe.prepTime = prepTime
        recipe.totalTime = totalTime
        recipe.servings = Int(servings) ?? 1
        recipe.directions = directions
        recipe.highlights = highlights
        recipe.image = recipeImage?.pngData()
        
        // Add the ingredients
        for i in ingredients {
            let ingredient = Ingredient(context: viewContext)
            ingredient.id = UUID()
            ingredient.name = i.name
            ingredient.unit = i.unit
            ingredient.num = i.num ?? 1
            ingredient.denom = i.denom ?? 1
            
            // Add this ingredient to the recipe
            recipe.addToIngredients(ingredient)
        }
        
        // Save to core data
        do {
            // Save the recipe to core data
            try viewContext.save()
            
            // Switch the view to list view
        }
        catch {
            // Couldn't save the recipe
        }
        
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView(tabSelection: Binding.constant(Constants.addRecipeTab))
    }
}
