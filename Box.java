package Boxes;

public class Box {
	private static int count = 0;
    protected int width, height, depth;

    protected Box(int width, int height, int depth) {
        this.width = width;
        this.height = height;
        this.depth = depth;
        count++;
    }

    public int getVolume() {
        return width * height * depth;
    }

    public static int getCount() {
        return count;
    }
}

