package Data;

public class DataManager
{
  private DataManager(){this.node=new Tree();}
  private static DataManager instance;
  public static synchronized DataManager get_instance()
  {
    if(instance==null)
    {
      instance=new DataManager();
    }
    return instance;
  }

  public void insertInfo(String name,String password)
  {
    this.node.insert(name, password);
  }

  public boolean verifyAcc(String name,String password)
  {
    if(this.node.checkValid(name, password)) return true;
    return false;

  }

  private Tree node;
}
