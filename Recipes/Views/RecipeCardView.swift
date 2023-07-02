//
//  RecipeCardView.swift
//  Recipes
//
//  Created by Christian Sohns on 6/26/23.
//

import SwiftUI
import WidgetKit

struct RecipeDetailView: View {
    
    @State var recipe: Recipe
    
    var body: some View {
        List {
            Section {
                HStack {
                    Text(recipe.title)
                        .font(.headline)
                }
            }
            Section {
                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text(ingredient)
                        .foregroundStyle(.gray)
                }
            } header: {
                Text("Ingredients")
            }
            Section {
                Text(recipe.instructions)
            } header: {
                Text("Instructions")
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button {
                    print("Share: \(recipe.title)")
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
            }
            ToolbarItem {
                Button {
                    recipe.isFavorite.toggle()
                    WidgetCenter.shared.reloadTimelines(ofKind: "Recipes")
                } label: {
                    if recipe.isFavorite {
                        Image(systemName: "star.fill")
                    } else {
                        Image(systemName: "star")
                    }
                }
            }
        }
    }
}
