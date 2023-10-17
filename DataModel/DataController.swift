//
//  DataController.swift
//  MozGrill
//
//  Created by Keven Goncalves on 17/10/23.
//

import Foundation
import CoreData


class DataController: ObservableObject{
    let container : NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "GrillModel")
        container.loadPersistentStores { des, error in
            if let error = error{
                print("Failed to load the Data: \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext){
        do{
            try context.save()
            print("Data Saved")
        }catch{
            print("Failed to Save \(error.localizedDescription)")
        }
    }
    
    func createUser(name:String, email:String, password:String, context:NSManagedObjectContext){
        let user = User(context: context)
        user.id = UUID()
        user.name = name
        user.email = email
        user.password = password
        
        save(context: context)
    }
    
    func getUser(email:String, password:String, context:NSManagedObjectContext) -> User? {
        let fetchedRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchedRequest.predicate = NSPredicate(format:"email == %@ AND password == %@",email,password)
        
        do {
            let users = try context.fetch(fetchedRequest)
            return users.first
        }catch{
            print("Error fetching user \(error.localizedDescription)")
            return nil
        }
    }
    
    func createRecipe(name:String, desc:String, duration:Int32, category:String, ingredients:String, directions:String, favorite:Bool, imageUrl:String, context:NSManagedObjectContext){
        let recipe = RecipeFood(context: context)
        
        recipe.id = UUID()
        recipe.name = name
        recipe.category = category
        recipe.desc = desc
        recipe.duration = duration
        recipe.igredients = ingredients
        recipe.directions = directions
        recipe.favorite = favorite
        recipe.imageUrl = imageUrl
        recipe.created_at = Date()
        
        save(context: context)

    }
    
    func editRecipe(recipe:RecipeFood, name:String, desc:String, duration:Int32, category:String, ingredients:String, directions:String, favorite:Bool, imageUrl:String, context:NSManagedObjectContext){
        
        recipe.name = name
        recipe.category = category
        recipe.desc = desc
        recipe.duration = duration
        recipe.igredients = ingredients
        recipe.directions = directions
        recipe.favorite = favorite
        recipe.imageUrl = imageUrl
        recipe.created_at = Date()
        
        save(context: context)
    }
    
    func getAllRecipe(context: NSManagedObjectContext) -> [RecipeFood]{
        let fetchedRequest:NSFetchRequest<RecipeFood> = RecipeFood.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key:"created_at",ascending: false)
        
        fetchedRequest.sortDescriptors = [sortDescriptor]
        
        do{
            let recipes = try context.fetch(fetchedRequest)
            return recipes
        }catch{
            print("Error Requesting Users \(error.localizedDescription)")
            return []
        }
    }
    
    func deleteRecipe(recipe: RecipeFood, context: NSManagedObjectContext){
        context.delete(recipe)
        save(context: context)
    }
}
