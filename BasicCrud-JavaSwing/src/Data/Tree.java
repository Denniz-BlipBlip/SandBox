package Data;
import java.util.Random;

public class Tree 
{
  public Tree()
  {
    this.root=null;
    this.rand=new Random();
  }

  public void insert(String name,String password)
  {
    this.root=insert(this.root,name,id_generator(),password);
  }

  public boolean checkValid(String name,String password)
  {
    if(this.checkValid(this.root, name, password)) return true;
    return false;
  }

  private Node insert(Node root,String name,int id,String password)
  {
    if(root==null){return new Node(new Data(name,id,password));}

    if(id>root.get_data().get_id())
    {
      return root.set_right(insert(root.get_right(),name,id,password));
    }
    else 
    {
      return root.set_left(insert(root.get_left(),name,id,password));
    }
  }

  private boolean checkValid(Node root,String name,String password)
  {
    if(root==null){return false;}

    if(root.get_data().get_name().equals(name)&&root.get_data().get_password().equals(password))
    {
      return true;
    }

    return checkValid(root.get_left(), name, password)||checkValid(root.get_right(), name, password);
  }

  private int id_generator()
  {
    int id=rand.nextInt(900000)+100000;
    return id;
  }

  private Node root;
  private Random rand;
}
