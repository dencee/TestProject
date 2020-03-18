import java.awt.image.BufferedImage;

import javax.imageio.ImageIO;

public class Enemy extends GameObject{

	public static BufferedImage image;
	public static boolean needImage = true;
	public static boolean gotImage = false;	
	
	Enemy(int x, int y, int width, int height) {
		super(x, y, width, height);
		// TODO Auto-generated constructor stub
		if(needImage) {
			loadImage("enemy.png");
		}
	}
	
	void loadImage(String imageFile) {
	    if (needImage) {
	        try {
	            image = ImageIO.read(this.getClass().getResourceAsStream(imageFile));
		    gotImage = true;
	        } catch (Exception e) {
	            
	        }
	        needImage = false;
	    }
	}

}
