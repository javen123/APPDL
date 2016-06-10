//
//  Address+CoreDataProperties.swift
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

extension Address {

    @NSManaged var street: String?
    @NSManaged var suite: String?
    @NSManaged var city: String?
    @NSManaged var zip: String?
    @NSManaged var lat: String?
    @NSManaged var lng: String?
    @NSManaged var client: NSManagedObject?

}
