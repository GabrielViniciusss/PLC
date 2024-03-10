package Java.Q4.obj;

public class CoffeeMachine {
    double availableWater;
    double availableMilk;
    double availableCoffee;

    public CoffeeMachine(double availableWater, double availableMilk, double availableCoffee) {
        this.availableWater = availableWater;
        this.availableMilk = availableMilk;
        this.availableCoffee = availableCoffee;
    }

    public void makeCoffee(Coffee coffee) {
        
        if (availableWater >= coffee.waterRequired && availableMilk >= coffee.milkRequired && availableCoffee >= coffee.coffeeRequired) {
            availableWater -= coffee.waterRequired;
            availableMilk -= coffee.milkRequired;
            availableCoffee -= coffee.coffeeRequired;
            coffee.prepare();
        }
        else
            System.out.println("Recursos insuficientes para fazer café " + coffee.name);
    }
}