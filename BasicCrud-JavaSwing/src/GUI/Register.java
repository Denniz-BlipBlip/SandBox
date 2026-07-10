package GUI;

import javax.swing.BoxLayout;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class Register extends JPanel
{
  public Register(Window win)
  {
    this.window=win;
    setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
    setAlignmentX(CENTER_ALIGNMENT);
    setBackground(Bg_COLOR);
  }

  private void textField(JTextField field)
  {

  }
}
