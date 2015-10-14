//
//  Person.swift
//  iOSFoundationsHomework8
//
//  Created by Regular User on 10/10/15.
//  Copyright © 2015 Lynn Kuhlman. All rights reserved.
//

import UIKit

class Person : NSObject, NSCoding {
    var firstName : String
    var lastName = "Doe"
    var image : UIImage?
    
    init (fName : String, lName : String, photo: UIImage?) {
        firstName = fName
        lastName = lName
        image = photo
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let firstName = aDecoder.decodeObjectForKey("firstName") as? String {
            self.firstName = firstName
        } else {
            self.firstName = "NA"
        }
        if let lastName = aDecoder.decodeObjectForKey("lastName") as? String {
            self.lastName = lastName
        }
        if let data = aDecoder.decodeObjectForKey("image") as? NSData {
            self.image = UIImage(data: data)
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(firstName, forKey: "firstName")
        aCoder.encodeObject(lastName, forKey: "lastName")
        
        if let image = self.image {
            if let data = UIImagePNGRepresentation(image) {
                aCoder.encodeObject(data, forKey: "image")
            }
        }
    }
}