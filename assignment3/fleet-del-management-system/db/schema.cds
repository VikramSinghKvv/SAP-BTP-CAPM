namespace logistics.fleet;

/* ---------- Reusable Types ---------- */
type Phone : String(15);
type Email : String;
type Amount : Decimal(10,2);
type Distance : Decimal(10,2);
type City : String(50);
type Address : String(255);
type Rating : Decimal(2,1);

/* ---------- Enums ---------- */
type VehicleType : String enum { Bike; Van; Truck; Trailer; }
type FuelType : String enum { Petrol; Diesel; Electric; CNG; }
type VehicleStatus : String enum { Available; OnTrip; Maintenance; Retired; }
type DriverStatus : String enum { Available; OnTrip; OnLeave; }
type ShipmentStatus : String enum { Booked; PickedUp; InTransit; OutForDelivery; Delivered; Failed; }
type PaymentStatus : String enum { Pending; Paid; COD; }
type CustomerTier : String enum { Regular; Premium; Enterprise; }

/* ---------- Entities ---------- */

entity Vehicles {
  key ID : UUID;
  registrationNumber : String;
  type : VehicleType;
  make : String;
  model : String;
  year : Integer;
  capacity : Integer;
  fuelType : FuelType;
  status : VehicleStatus default 'Available';
  lastServiceDate : Date;
  mileage : Integer;
  insuranceExpiry : Date;
}

entity Drivers {
  key ID : UUID;
  name : String;
  licenseNumber : String;
  licenseExpiry : Date;
  phone : Phone;
  email : Email;
  experience : Integer;
  rating : Rating;
  status : DriverStatus default 'Available';
  vehicleId : Association to Vehicles;
  joinDate : Date;
}

entity Customers {
  key ID : UUID;
  name : String;
  company : String;
  phone : Phone;
  email : Email;
  address : Address;
  city : City;
  pincode : String(10);
  gstNumber : String;
  tier : CustomerTier default 'Regular';
}

entity Shipments {
  key ID : UUID;

  trackingNumber : String;

  customer : Association to Customers;
  driver : Association to Drivers;
  vehicle : Association to Vehicles;

  pickupAddress : Address;
  deliveryAddress : Address;
  pickupCity : City;
  deliveryCity : City;

  weight : Integer;

  status : ShipmentStatus default 'Booked';

  bookedAt : Timestamp;
  pickedUpAt : Timestamp;
  deliveredAt : Timestamp;
  estimatedDelivery : Timestamp;

  actualDistance : Distance;
  charges : Amount;

  paymentStatus : PaymentStatus default 'Pending';
}

entity Routes {
  key ID : UUID;

  fromCity : City;
  toCity : City;
  distance : Distance;
  estimatedHours : Decimal(5,2);
  tollCharges : Amount;
  isActive : Boolean default true;
}

entity ServiceRecords {
  key ID : UUID;

  vehicle : Association to Vehicles;

  serviceDate : Date;
  serviceType : String;
  cost : Amount;
  description : String;
  nextServiceDate : Date;
}