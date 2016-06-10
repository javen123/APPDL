//
//  Client+CoreDataProperties.swift
//  APPDL
//
//  Created by Jim Aven on 6/8/16.
//  Copyright © 2016 JIm Aven. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Client {

    @NSManaged var email: String?
    @NSManaged var fullname: String?
    @NSManaged var website: String?
    @NSManaged var username: String?
    @NSManaged var phone: String?
    @NSManaged var id: NSNumber?
    @NSManaged var address: Address?
    @NSManaged var company: Company?

}
