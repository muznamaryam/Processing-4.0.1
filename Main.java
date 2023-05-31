package Boxes;

public class Main {

	public static void main(String[] args) {
		Box[] boxes = new Box[9];
		
        for (int i = 0; i < 5; i++) {
            boxes[i] = new BigBox();
        }
        
        for (int i = 5; i < 9; i++) {
            boxes[i] = new SmallBox();
        }
        
        int totalVolume = 0;
        for (Box box : boxes) {
            totalVolume += box.getVolume();
        }
        double averageVolume = (double) totalVolume / boxes.length;
        System.out.println("Average volume: " + averageVolume);
    }

}
