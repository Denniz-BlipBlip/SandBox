package GUI;
import java.awt.BorderLayout;
import java.awt.Color;
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
    this.field=new Field();
    //this.window=window;
    setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
    setBackground(BG_COLOR);
    setBorder(BorderFactory.createEmptyBorder(0,30,30,30));

    JTextField txtField=new JTextField();
    JLabel label=new JLabel("Username");

    add(field.textField(label,txtField,this.FONT_COLOR,this.BG_COLOR));
  }

  private final Color FONT_COLOR=Color.BLACK;
  private final Color BG_COLOR=Color.RED;
  private Window window;
  private Field field;
}
