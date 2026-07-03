package GUI;

import java.awt.Color;
import java.awt.Dimension;
import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class Field
{
  public JPanel textField(JLabel label,JTextField field,Color font_color,Color bg_color)
  {
    JPanel panel=new JPanel();
    panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
    panel.setBackground(bg_color);

    field.setForeground(font_color);
    field.setMaximumSize(new Dimension(Integer.MAX_VALUE,40));

    label.setForeground(font_color);

    panel.add(label);
    panel.add(Box.createVerticalStrut(15));
    panel.add(field);
    panel.add(Box.createVerticalStrut(10));

    return panel;
  }
}
