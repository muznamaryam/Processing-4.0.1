package Cars;

public class Car {
   double currentSpeed;
   double maximumSpeed;
   double acceleration;
   
   Car(double maximumSpeed) {
	   this.currentSpeed = 0;
	   this.acceleration = 10.0;
	   this.maximumSpeed = maximumSpeed;
   }
   
   public double getSpeed() {
	   return currentSpeed;
   }
   public void doAccelerate() {
	   currentSpeed = currentSpeed + acceleration;
	   
	   if (currentSpeed > maximumSpeed) {
		   currentSpeed = maximumSpeed;
	   }
	   }
   
   }

