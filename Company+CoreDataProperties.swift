//
//  Company+CoreDataProperties.swift
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

extension Company {

    @NSManaged var bs: String?
    @NSManaged var catchPhrase: String?
    @NSManaged var name: String?
    @NSManaged var client: NSManagedObject?

}
