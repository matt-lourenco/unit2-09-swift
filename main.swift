//
//  main.swift
//  This program tests the vehicle class
//
//  Created by Matthew Lourenco on 09/04/18.
//  Copyright © 2018 MTHS. All rights reserved.
//

public class Vehicle {
	// This is a blueprint that defines a vehicle
	
	private enum MyError : Error {
    	case InvalidLicensePlateException(String)
	}
	
	public enum Colours {
		case WHITE
		case GREY
		case BLACK
		case RED
		case ORANGE
		case YELLOW
		case GREEN
		case BLUE
		case PURPLE
	}
	
	var _licensePlate: String
	var _colour: Colours
	var _numberOfDoors: Int = 4
	var _numberOfWheels: Int = 4
	var _numberOfTires: Int = 4
	var _speed: Int = 0    		// km/h
	var _maxSpeed: Int = 200	// km/h
	
	public init(licensePlate: String, colour: Colours) throws {
		//Default Constructor for vehicle class
		if licensePlate.count == 7 {
			_licensePlate = licensePlate
		} else {
			throw MyError.InvalidLicensePlateException("License is invalid length")
		}
		_colour = colour;
	}
	
	func getLicensePlate() -> String { return _licensePlate } //Getter
	
	func setLicensePlate(newPlate: String) throws {
		//Setter
		if newPlate.count == 7 {
			_licensePlate = newPlate
		} else {
			throw MyError.InvalidLicensePlateException("License is invalid length")
		}
	}
	
	func getColour() -> Colours { return _colour } //Getter
	
	func setColour(newColour: Colours) {
		//Setter
		_colour = newColour
	}
	
	func getNumberOfDoors() -> Int { return _numberOfDoors } //Getter
	
	func getNumberOfWheels() -> Int { return _numberOfWheels } //Getter

	func getNumberOfTires() -> Int { return _numberOfTires } //Getter
	
	func getSpeed() -> Int { return _speed } //Getter
	
	func getMaxSpeed() -> Int { return _maxSpeed } //Getter
	
	func accelerate(amount: Int) {
		//Allows the vehicle to accelerate an amount
		_speed += amount
		if(_speed > _maxSpeed) {
			_speed = _maxSpeed
		}
	}
	
	func brake(amount: Int) {
		//Allows the vehicle to brake an amount
		_speed -= amount
		if(_speed < 0) {
			_speed = 0
		}
	}
	
	func getValues() -> String{
		//Returns the fields of the class
		return "License plate: \(_licensePlate)\nColour: \(_colour)\nNumber of doors: \(_numberOfDoors)\nNumber of wheels: \(_numberOfWheels)\nNumber of tires: \(_numberOfTires)\nSpeed: \(_speed)km/h\nMaximum speed: \(_maxSpeed)km/h";
	}
}

public class Bike: Vehicle {
	// This is a blueprint that defines a bike
	
	var _cadence: Int = 0
	var _gear: Int = 1
	var _maxGear: Int = 6
	
	public init(colour: Colours) throws {
		// override constructor
		try super.init(licensePlate: "AAAA111", colour: colour)
		_numberOfDoors = 0
		_numberOfWheels = 2
		_numberOfTires = _numberOfWheels
		_maxSpeed = 50
		_licensePlate = ""
	}

	public init(colour: Colours, maxSpeed: Int) throws {
		// override constructor
		try super.init(licensePlate: "AAAA111", colour: colour)
		_numberOfDoors = 0
		_numberOfWheels = 2
		_numberOfTires = _numberOfWheels
		_maxSpeed = maxSpeed
		_licensePlate = ""
	}
	
	override func setLicensePlate(newPlate: String) { } // Override
	
	func getCadence() -> Int { return _cadence } //Getter
	
	func setCadence(newCadence: Int) {
		//Setter
		_cadence = newCadence
		if (_cadence >= 0) {
			_speed = _cadence * _gear;
			if (_speed > _maxSpeed) {
				_speed = _maxSpeed;
			}
		} else {
			_speed = 0;
		}
	}
	
	func getGear() -> Int { return _gear } //Getter
	
	func setGear(newGear: Int) {
		// Setter for the gear
		if (newGear < 0) {
			_gear = 0
		} else if (newGear > _maxGear) {
			_gear = _maxGear
		} else {
			_gear = newGear
		}
		
		_speed = _cadence * _gear
		if (_speed > _maxSpeed) {
			_speed = _maxSpeed
		}
	}
	
	func getMaxGear() -> Int { return _maxGear } //Getter
	
	override func accelerate(amount: Int) { } // Override
	
	override func brake(amount: Int) { } // Override
	
	func brake() {
		//Allows the bike to stop
		_cadence = 0
		_speed = 0
	}
	
	func getStatus() -> String {
		//Returns the relevant fields of the class
		return "Colour: \(_colour)\nCadence: \(_cadence)\nGear: \(_gear)\nSpeed: \(_speed)km/h\n"
	}
}

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

print("Bike1")
let bike1: Bike = try Bike(colour: Bike.Colours.RED)
bike1.setCadence(newCadence: 9999)
print(bike1.getStatus())

print("\nBike2")
let bike2: Bike = try Bike(colour: Bike.Colours.RED, maxSpeed: 200)
bike2.setCadence(newCadence: 9999)
print(bike2.getStatus())

print("\nTruck1")
let truck1: Truck = try Truck(licensePlate: "BBBB445", colour: Truck.Colours.WHITE)
print(truck1.getStatus())

print("\nTruck2")
let truck2: Truck = try Truck(licensePlate: "BBBB445")
print(truck2.getStatus())