package GUI;
import Data.DataManager;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

public class Register extends JPanel
{
  public Register(Window win)
  {
    this.manager=manager.get_instance();
    this.window=win;
    setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
    setAlignmentX(CENTER_ALIGNMENT);
    setBackground(BG_COLOR);

    this.textField=new JTextField();
    this.passField=new JPasswordField();
    this.loginBtn=new JButton("Login");
    this.registerBtn=new JButton("Register");

    this.registerBtn.addActionListener(e->this.registerHandler());
    this.loginBtn.addActionListener(e->this.back_handler());

    add(this.field(textField, "Username"));
    add(this.field(passField, "Password"));
    add(Box.createVerticalStrut(10));
    add(btn_field(registerBtn));
    add(btn_field(loginBtn));
  }

  private JPanel field(JTextField field,String labelName)
  {
    JPanel panel=new JPanel();
    JLabel label=new JLabel(labelName);

    panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
    panel.setBackground(BG_COLOR);
    panel.setAlignmentX(CENTER_ALIGNMENT);

    field.setAlignmentX(CENTER_ALIGNMENT);
    field.setFont(FONT_TEXT);
    field.setForeground(FONT_COLOR);
    field.setMaximumSize(FIELD_SIZE);

    label.setAlignmentX(LEFT_ALIGNMENT);
    label.setForeground(FONT_COLOR);
    label.setFont(FONT_TITLE);

    panel.add(Box.createVerticalStrut(15));
    panel.add(label);
    panel.add(Box.createVerticalStrut(10));
    panel.add(field);
    return panel;
  }

  private JPanel btn_field(JButton btn)
  {
    JPanel panel=new JPanel();

    panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
    panel.setAlignmentX(CENTER_ALIGNMENT);
    panel.setBackground(BG_COLOR);

    btn.setMaximumSize(BTN_SIZE);
    btn.setForeground(FONT_COLOR);
    btn.setFont(FONT_TEXT);
    btn.setAlignmentX(CENTER_ALIGNMENT);

    panel.add(Box.createVerticalStrut(15));
    panel.add(btn);
    return panel;
  }

  private void back_handler()
  {
    this.window.show_panel("Login");
  }

  private void registerHandler()
  {
    String username=this.textField.getText();
    String password=new String(this.passField.getPassword());

    if(username.isEmpty()||password.isEmpty())
    {
      JOptionPane.showMessageDialog(this, "All field must be filled","Error",JOptionPane.ERROR_MESSAGE);
      return;
    }
    else 
    {
      manager.insertInfo(username,password);
      back_handler();
      return;
    }
  }

  private JTextField textField;
  private JPasswordField passField;
  private JButton registerBtn,loginBtn;
  private final Dimension BTN_SIZE=new Dimension(Integer.MAX_VALUE,40);
  private final Dimension FIELD_SIZE=new Dimension(Integer.MAX_VALUE,40);
  private final Color FONT_COLOR=Color.BLACK;
  private final Color BG_COLOR=Color.RED;
  private final Font FONT_TITLE=new Font("Monospaced",Font.BOLD,30);
  private final Font FONT_TEXT=new Font("Monospaced",Font.BOLD,24);
  private Window window;
  private DataManager manager;
}
