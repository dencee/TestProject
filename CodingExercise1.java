import java.awt.Color;
import javax.swing.JOptionPane;
import org.jointheleague.graphical.robot.Robot;

/* Level 0 Exam: Coding  Exercise #1 */
public class CodingExercise1 {

    public static void main(String[] args) {
    	 Robot rob = new Robot();
    	// 3. ask the user what color they would like the Robot to draw
String colur =JOptionPane.showInputDialog("what color star do you want?");
   	 // 4. use an if/else statement to set the pen color that the user requested (minimum of 2 colors)
if(colur.equals("red")) {
	rob.setPenColor(255,0,0);
}
else if(colur.equals("green")) {
	rob.setPenColor(0,255,0);
}
else if(colur.equals("blue")) {
	rob.setPenColor(0,0,255);
}
else {
	JOptionPane.showMessageDialog(null,"you think you're so smart, huh, well enjoy eternity closing tabs");
for (int t = 0; t < 1000000000; t++) {
	JOptionPane.showMessageDialog(null, "why");
}
}
   	 // 2. set the pen width to 10
rob.setPenWidth(10);
   	 // 1. make the Robot draw a shape
  
   	rob.penDown();
   	 for (int i = 0; i < 5; i++) {
		
	
   	rob.move(100);
   	 rob.turn(144);
   	 }
    }

}
