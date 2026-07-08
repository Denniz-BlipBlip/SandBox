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
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class Login extends JPanel
{
  public Login()
  {
    //this.window=window;
    setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
    setBackground(BG_COLOR);
    setBorder(BorderFactory.createEmptyBorder(0,30,30,30));

    JTextField txtField=new JTextField();
    JLabel label=new JLabel("Username");

    add(this.field(txtField, label));
  }

  private JPanel field(JTextField field,JLabel label)
  {
    JPanel panel=new JPanel();
    panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
    panel.setAlignmentX(CENTER_ALIGNMENT);
    panel.setBackground(this.BG_COLOR);

    field.setAlignmentX(CENTER_ALIGNMENT);
    field.setMaximumSize(this.FIELD_SIZE);
    field.setForeground(this.FONT_COLOR);
    field.setFont(this.FONT_STYLE);

    label.setAlignmentX(LEFT_ALIGNMENT);
    label.setFont(this.FONT_TITLE);
    label.setForeground(this.FONT_COLOR);

    panel.add(label);
    //panel.add(Box.createVerticalStrut(10));
    //panel.add(field);
    //panel.add(Box.createVerticalStrut(15));
    return panel;
  }

  private final Color FONT_COLOR=Color.BLACK;
  private final Color BG_COLOR=Color.RED;
  private final Dimension FIELD_SIZE=new Dimension(Integer.MAX_VALUE,40);
  private final Font FONT_STYLE=new Font("Monospaced",100,Font.BOLD);
  private final Font FONT_TITLE=new Font("Monospaced",100,Font.BOLD);
  private Window window;
}
