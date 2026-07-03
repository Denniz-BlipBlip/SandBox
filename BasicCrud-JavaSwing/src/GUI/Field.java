package GUI;

import javax.swing.BoxLayout;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class Field
{
  public JPanel textField(String name,JTextField field,Color color)
  {
    JPanel panel=new JPanel();
    panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
    panel.setAlignmentX(Center_Alignment);

    return panel;
  }
}
