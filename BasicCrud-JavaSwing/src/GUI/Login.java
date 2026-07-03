package GUI;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Window;

import javax.swing.BorderFactory;
import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.JPanel;

public class Login extends JPanel
{
  public Login(Window window)
  {
    this.window=window;
    setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
    setBackground(BG_COLOR);
    setBorder(BorderFactory.createEmptyBorder(0,30,30,30));
  }

  private JPanel field()
  {
    JPanel panel=new JPanel();
    setLayout(new BoxLayout(panel,BoxLayout.Y_AXIS));
  }

  private final Color BG_COLOR=Color.RED;
  private Window window;
}
