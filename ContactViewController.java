package GuestBook;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class ContactViewController implements ActionListener {
    //Create frame
    JFrame frame = new JFrame();
                                
    //Create panel
    JPanel panelMain = new JPanel(new BorderLayout());
    JPanel panelLabels = new JPanel();
    JPanel panelText = new JPanel();
    JPanel panelButton = new JPanel();
            
    //Create buttons
    JButton submit = new JButton("Submit");
        
    //Create text field
    JTextField firstName = new JTextField(1);
    JTextField lastName = new JTextField(1);
    JTextField address = new JTextField(1);
    JTextField phone = new JTextField(1);
        
    //Create labels
    JLabel firNam = new JLabel ("First Name", JLabel.CENTER);
    JLabel laNam = new JLabel ("Last Name", JLabel.CENTER);
    JLabel ad = new JLabel ("Address", JLabel.CENTER);
    JLabel phNum = new JLabel ("Phone Number", JLabel.CENTER);
    
    JTextArea contactInfo = new JTextArea();
    JScrollPane scrollPane = new JScrollPane(contactInfo);
    
    public ContactViewController() {
        //Make frame visible
        frame.setVisible(true);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
        //Add panel to frame
        frame.add(panelMain);
//        frame.add(panelLabels);
//        frame.add(panelText);
//        frame.add(panelButton);
        
        // Make the fields display in a column
        panelLabels.setLayout(new BoxLayout(panelLabels, BoxLayout.Y_AXIS));
        panelText.setLayout(new BoxLayout(panelText, BoxLayout.Y_AXIS));
                
        //Add panels to main panel
        panelMain.add(panelLabels, BorderLayout.WEST);
        panelMain.add(panelText, BorderLayout.CENTER);
        panelMain.add(panelButton, BorderLayout.SOUTH);
        
        //Add text fields to text panel
//        panelText.add(firstName);
//        panelText.add(lastName);
//        panelText.add(address);
//        panelText.add(phone);
        panelText.add(scrollPane);
        
        //Add labels to label panel
        panelLabels.add(firNam);
        panelLabels.add(laNam);
        panelLabels.add(ad);
        panelLabels.add(phNum);
        
        //Add button to button panel
        panelButton.add(submit);
                
        //Pack the frame to make it just big enough for the buttons
        frame.pack();
                
        //Add action listeners
        submit.addActionListener (this);
        
    }
    
    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getSource() == submit) {
            String fName = firstName.getText();
            String lName = lastName.getText();
            String add = address.getText();
            String ph = phone.getText();
            //firstName.set
            //String binToDecString = JOptionPane.showInputDialog("Enter Binary Number to convert to Decimal");
            //System.out.println(Binary.convertToDecimal(binToDecString));  
            //JOptionPane.showMessageDialog(null, Binary.convertToDecimal(binToDecString));         
        }
    }
}
