

/* Level 0 Exam: Coding  Exercise #2 */
import javax.swing.JOptionPane;

/**
 * Write a program that asks the user for their age. 
 * Tell them which year they were born. 
 * If they are over 30, tell them they are too old to play this game.
 **/

public class CodingExercise2 {
public static void main(String[] args) {
	String age =JOptionPane.showInputDialog("How old are you?");
	int age1 = Integer.parseInt(age);
	if(age1>30) {
		JOptionPane.showMessageDialog("you are too old to play this game");
	}
	else {
		
	
	age1=2020-age1;
	JOptionPane.showMessageDialog(null, "you were born in the year "+age1);
}
}
}



