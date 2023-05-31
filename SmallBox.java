package Boxes;

public class SmallBox extends Box {
	 private int extHeight = 0;

	    public SmallBox() {
	        super(3, 2, 1);
	    }

	    public void addExtension(int addHeight) {
	        if (addHeight == 1 || addHeight == 2) {
	            extHeight += addHeight;
	            height += addHeight;
	        }
	    }

	    public void removeExtension() {
	        height -= extHeight;
	        extHeight = 0;
	    }
	}

