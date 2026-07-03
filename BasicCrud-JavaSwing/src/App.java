import javax.swing.SwingUtilities;

import GUI.Window;

public class App
{
  public static void main(String[] args) {
    SwingUtilities.invokeLater(new Runnable(){
      public void run()
      {
        new Window();
      }
    });
  }
}
