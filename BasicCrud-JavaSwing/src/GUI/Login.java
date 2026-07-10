package GUI;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.TextField;
import java.awt.Window;
import javax.swing.BorderFactory;
import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

import jdk.javadoc.internal.api.JavadocTool;

public class Login extends JPanel
{
  public Login()
  {
    //this.window=window;
    setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
    setBackground(BG_COLOR);
    setBorder(BorderFactory.createEmptyBorder(0,30,30,30));
  }

  private JPanel field(String fieldName,String labelName)
  {
    JPanel panel=new JPanel();
    panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
    panel.setAlignmentX(CENTER_ALIGNMENT);
    panel.setBackground(this.BG_COLOR);

    JTextField
    field.setAlignmentX(CENTER_ALIGNMENT);
    field.setMaximumSize(this.FIELD_SIZE);
    field.setForeground(this.FONT_COLOR);
    field.setFont(this.FONT_STYLE);

    label.setAlignmentX(LEFT_ALIGNMENT);
    label.setFont(this.FONT_TITLE);
    label.setForeground(this.FONT_COLOR);

    panel.add(Box.createVerticalStrut(15));
    panel.add(label);
    panel.add(Box.createVerticalStrut(10));
    panel.add(field);
    return panel;
  }

  private JPanel btn_field(JButton btn)
  {
    JPenel panel=new JPanel();
    panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
    panel.setBackground(BG_COLOR);
    panel.setAlignmentX(CENTER_ALIGNMENT);

    btn.setMaximumSize(BTN_SIZE);
    btn.setFont(FONT_STYLE);
    btn.setBackground(BTN_COLOR);

    panel.add(btn);
    return panel;
  }

  private final Color FONT_COLOR=Color.BLACK;
  private final Color BG_COLOR=Color.BLUE;
  private final Dimension FIELD_SIZE=new Dimension(Integer.MAX_VALUE,40);
  private final Font FONT_STYLE=new Font("Monospaced",Font.BOLD,24);
  private final Font FONT_TITLE=new Font("Monospaced",Font.BOLD,40);
  private Window window;
}
