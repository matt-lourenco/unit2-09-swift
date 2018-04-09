//
//  truck.swift
//  This class is a blueprint for a truck that extends a vehicle
//
//  Created by Matthew Lourenco on 09/04/18.
//  Copyright © 2018 MTHS. All rights reserved.
//

public class Truck: Vehicle {
	// This class is a blueprint that defines a truck
	
	var _capacity: Int = 2000 //kg
	
	override public init(licensePlate: String, colour: Colours) throws {
		//Constructor override
		try super.init(licensePlate: licensePlate, colour: colour)
		_numberOfDoors = 2
		_maxSpeed = 100
	}

	public init(licensePlate: String) throws {
		//Constructor override
		try super.init(licensePlate: licensePlate, colour: Vehicle.Colours.BLACK)
		_numberOfDoors = 2
		_maxSpeed = 100
	}
	
	func getCapacity() -> Int { return _capacity; } //Getter
	
	func getStatus() -> String {
		//Returns the relevant fields of the class
		return "License plate: \(_licensePlate)\nColour: \(_colour)\nSpeed: \(_speed)km/h\n"
	}
}
