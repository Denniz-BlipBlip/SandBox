package GUI;
import java.awt.BorderLayout;
import java.awt.CardLayout;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class Window extends JFrame
{
  public Window()
  {
    setSize(500,500);
    setLayout(new BorderLayout());
    setLocationRelativeTo(null);
    setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    this.layout=new CardLayout();
    this.panel=new JPanel(layout);

    panel.add(new Login(new Window()),"Login");
    panel.add(new Register(), "Register");
    layout.show(panel,"Login");

    add(this.panel);
    setVisible(true);
  }

  public void show_panel(String name)
  {
    this.layout.show(this.panel, name);
  }

  private JPanel panel;
  private CardLayout layout;
}
