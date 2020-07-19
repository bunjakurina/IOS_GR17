






import Foundation
import CoreData


extension Vendet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Vendet> {
        return NSFetchRequest<Vendet>(entityName: "Vendet")
    }

    @NSManaged public var name: String?
    @NSManaged public var ssn: String?

}
