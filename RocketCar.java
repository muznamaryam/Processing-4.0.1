package Cars;

public class RocketCar extends Car {
          private boolean doBoost;
          private boolean boostUsed;
          
          public RocketCar() {
        	  super(400.0);
        	  doBoost = false;
        	  boostUsed = false;
          }
          
          public void boost() {
        	  if (!boostUsed) {
        		  doBoost = true;
        		  boostUsed = true;
        	  }
          }
          
          public void doAccelerate() {
        	  if(doBoost) {
        		  currentSpeed += 20.0;
        		  doBoost = false;
        	  } else {
        		  super.doAccelerate();  
              }
       }
}
