package Cars;

public class TestCar {

	public static void main(String[] args) {
		Car Cars[] = new Car[20];
		
		for(int iPos = 0; iPos < 10; iPos++) {
			Cars[iPos] = new DefaultCar();
		}

		for(int iPos = 10; iPos < Cars.length; iPos++) {
			Cars[iPos] = new RocketCar();
		}
		
		for(int iPos = 0; iPos < Cars.length; iPos++) {
			Cars[iPos].doAccelerate();
			System.out.println(Cars[iPos].getSpeed());
		}
	}
}
