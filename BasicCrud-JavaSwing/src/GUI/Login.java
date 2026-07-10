package GUI;
import Data.DataManager;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import javax.swing.BorderFactory;
import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

public class Login extends JPanel
{
  public Login(Window win)
  {
    this.manager=manager.get_instance();
    this.window=win;
    setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
    setBackground(BG_COLOR);
    setBorder(BorderFactory.createEmptyBorder(0,30,30,30));

    textField=new JTextField();
    passwordField=new JPasswordField();
    loginBtn=new JButton("Login");
    registerBtn=new JButton("Register");

    loginBtn.addActionListener(e->login_handler());
    registerBtn.addActionListener(e->back_handler());

    add(this.field(textField,"Username"));
    add(this.field(passwordField, "Password"));
    add(Box.createVerticalStrut(10));
    add(this.btn_field(loginBtn));
    add(this.btn_field(registerBtn));
  }

  private JPanel field(JTextField field,String labelName)
  {
    JPanel panel=new JPanel();
    JLabel label=new JLabel(labelName);

    panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
    panel.setAlignmentX(CENTER_ALIGNMENT);
    panel.setBackground(this.BG_COLOR);

    field.setAlignmentX(CENTER_ALIGNMENT);
    field.setMaximumSize(this.FIELD_SIZE);
    field.setFont(this.FONT_STYLE);
    field.setForeground(this.FONT_COLOR);

    label.setAlignmentX(LEFT_ALIGNMENT);
    label.setFont(this.FONT_TITLE);
    label.setForeground(this.FONT_COLOR);

    panel.add(Box.createVerticalStrut(15));
    panel.add(label);
    panel.add(field);
    panel.add(Box.createVerticalStrut(10));
    return panel;
  }

  private JPanel btn_field(JButton btn)
  {
    JPanel panel=new JPanel();

    panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
    panel.setBackground(BG_COLOR);
    panel.setAlignmentX(CENTER_ALIGNMENT);

    btn.setMaximumSize(BTN_SIZE);
    btn.setFont(FONT_STYLE);
    btn.setBackground(BTN_COLOR);

    panel.add(Box.createVerticalStrut(15));
    panel.add(btn);
    return panel;
  }

  private void back_handler()
  {
    this.window.show_panel("Register");
  }

  private void login_handler()
  {
    String username=textField.getText();
    String password=new String(passwordField.getPassword());
    if(username.isEmpty()||password.isEmpty())
    {
      JOptionPane.showMessageDialog(this,"All field must be filled","Error",JOptionPane.ERROR_MESSAGE);
      return;
    }
    else if(!username.isEmpty()&&!password.isEmpty())
    {
      if(manager.verifyAcc(username, password))
      {
        JOptionPane.showMessageDialog(this, "Successfully login");
        return;
      }
      else 
      {
        JOptionPane.showMessageDialog(this, "Wrong password or username");
        this.textField.setText("");
        this.passwordField.setText("");
        return;
      }
    }
  }

  private JTextField textField;
  private JPasswordField passwordField;
  private JButton loginBtn,registerBtn;
  private final Dimension BTN_SIZE=new Dimension(Integer.MAX_VALUE,30);
  private final Color BTN_COLOR=Color.RED;
  private final Color FONT_COLOR=Color.BLACK;
  private final Color BG_COLOR=Color.BLUE;
  private final Dimension FIELD_SIZE=new Dimension(Integer.MAX_VALUE,40);
  private final Font FONT_STYLE=new Font("Monospaced",Font.BOLD,24);
  private final Font FONT_TITLE=new Font("Monospaced",Font.BOLD,40);
  private Window window;
  private DataManager manager;
}
