
package Java.Q4.exec;

import Java.Q4.obj.Coffee;
import Java.Q4.obj.Cappucinno;
import Java.Q4.obj.Expresso;
import Java.Q4.obj.Latte;
import Java.Q4.obj.CoffeeMachine;

public class Main {
    public static void main(String[] args) {
        CoffeeMachine coffeeMachine = new CoffeeMachine(1000, 1000, 1000);

        Coffee espresso = new Expresso();
        Coffee latte = new Latte();
        Coffee cappuccino = new Cappucinno();
        
        coffeeMachine.makeCoffee(espresso);
        coffeeMachine.makeCoffee(latte);
        coffeeMachine.makeCoffee(cappuccino);
    }
}