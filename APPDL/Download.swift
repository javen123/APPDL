//
//  Download.swift
//  APPDL
//
//  Created by Jim Aven on 6/7/16.
//  Copyright © 2016 JIm Aven. All rights reserved.
//

import Foundation
import CoreData


class Download {
    
    static let dl = Download()
    
    func fetch (endPoint:String, completed:(Bool)->Void) {
        
        let url = NSURL(string: "http://jsonplaceholder.typicode.com/users")
        let request = NSURLRequest(URL: url!)
        
        print("Download start")
        let _ = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            
            data, response, error in
            
            print(data)
            
            if error != nil {
                print("Error:\(self):\(error?.localizedDescription)")
                
                
            } else {
                
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves)
                    
                    if let jsonaArray = json as? [AnyObject] {
                        for data in jsonaArray {
                            let x = data as! [String:AnyObject]
                            self.parseAndSaveData(x)
                        }
                        completed(true)
                    } else {
                        print("cant convert to dict")
                    }
                    
                } catch {
                    print("Error:\(self):can't parse object data")
                    
                }
            }
        }.resume()
    }
    
    func parseAndSaveData(data:[String:AnyObject]) {
        
        let user = NSEntityDescription.insertNewObjectForEntityForName("Client", inManagedObjectContext: ad.managedObjectContext) as! Client
        
        user.fullname = data["name"] as? String
        user.username = data["username"] as? String
        user.phone = data["phone"] as? String
        user.id = data["id"] as? Int
        user.email = data["email"] as? String
        user.website = data["website"] as? String
        
        let address = NSEntityDescription.insertNewObjectForEntityForName("Address", inManagedObjectContext: ad.managedObjectContext) as! Address
        
        
        address.street = data["address"]!["street"] as? String
        address.suite = data["address"]!["suite"] as? String
        address.city = data["address"]!["city"] as? String
        address.zip = data["address"]!["zipcode"] as? String
        
        if let geo = data["address"]!["geo"] as? [String:AnyObject] {
            address.lat = geo["lat"] as? String
            address.lng = geo["lng"] as? String
        }
        user.address = address
        
        let company = NSEntityDescription.insertNewObjectForEntityForName("Company", inManagedObjectContext: ad.managedObjectContext) as! Company
        
        company.bs = data["company"]!["bs"] as? String
        company.catchPhrase = data["company"]!["catchPhrase"] as? String
        company.name = data["company"]!["name"] as? String
        
        user.company = company
        
        ad.saveContext()
    }
}
