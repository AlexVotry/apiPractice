//
//  Spd.swift
//  apiPrac
//
//  Created by Alex Votry on 2/19/17.
//  Copyright © 2017 Alex Votry. All rights reserved.
//

import Foundation

class SpdCall: NSObject, NSCoding{
    var time: Date?
    var district: String?
    var crime: String?
    var location: String?
    var latitude: Double?
    var longitude: Double?
    var beat: String?

    override init() {  
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        self.time = aDecoder.decodeObject(forKey: "at_scene_time") as! Date?
        self.district = aDecoder.decodeObject(forKey: "district_sector") as! String?
        self.crime = aDecoder.decodeObject(forKey: "event_clearance_description") as! String?
        self.location = aDecoder.decodeObject(forKey: "hundred_block_location") as! String?
        self.latitude = aDecoder.decodeObject(forKey: "latitude") as! Double?
        self.longitude = aDecoder.decodeObject(forKey: "longitude") as! Double?
        self.beat = aDecoder.decodeObject(forKey: "zone_beat") as! String?
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.time, forKey: "at_scene_time")
        aCoder.encode(self.district, forKey: "district_sector")
        aCoder.encode(self.crime, forKey: "event_clearance_description")
        aCoder.encode(self.location, forKey: "hundred_block_location")
        aCoder.encode(self.latitude, forKey: "latitude")
        aCoder.encode(self.longitude, forKey: "longitude")
        aCoder.encode(self.beat, forKey: "zone_beat")
    }
}
