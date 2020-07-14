//
//  Person+CoreDataProperties.swift
//  PersonData
//
//  Created by Alok Upadhyay on 3/29/18.
//  Copyright © 2018 Alok. All rights reserved.
//
//

import Foundation
import CoreData


extension Person1 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person1> {
        return NSFetchRequest<Person1>(entityName: "Person1")
    }

    @NSManaged public var name: String?
    @NSManaged public var ssn: String?

}
