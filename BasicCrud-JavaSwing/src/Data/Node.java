package Data;

public class Node 
{
  public Node(Data data)
  {
    this.data=data;
    this.right=null;
    this.left=null;
  }

  public Node get_right(){return this.right;}
  public Node get_left(){return this.left;}
  public Data get_data(){return this.data;}
  public Node set_right(Node node){return this.right=node;}
  public Node set_left(Node node){return this.left=node;}

  private Data data;
  private Node right;
  private Node left;
}
