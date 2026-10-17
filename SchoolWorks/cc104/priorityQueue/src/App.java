import java.util.PriorityQueue;

public class App 
{
  public static void main(String[] args)
  {
    PriorityQueue pq=new PriorityQueue<String>();

    // if letters it checks the first letter which comes first
    // example: Apple then Baby it prints the Apple first A > B
    pq.add("red");
    pq.add("four");
    System.out.println(pq.peek());
  } 
}
