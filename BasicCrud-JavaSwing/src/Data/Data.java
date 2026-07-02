package Data;

public class Data 
{
  public Data(String name,int id,String passsword,double balance)
  {
    this.name=name;
    this.id=id;
    this.balance=balance;
  }

  public void set_name(String name){this.name=name;}
  public void set_id(int id){this.id=id;}
  public void set_balance(double amount){this.balance=amount;}
  public void set_password(String pass){this.password=pass;}
  public String get_password(){return this.password;}
  public int get_id(){return this.id;}
  public double get_balance(){return this.balance;}
  public String get_name(){return this.name;}

  private String name;
  private int id;
  private String password;
  private double balance;
}
