package Java.Q4.obj;

public class Cappucinno extends Coffee{
    public Cappucinno(){
        this.name = "Cappucinno";
        this.waterRequired = 20;
        this.milkRequired = 60;
        this.coffeeRequired = 40;
    }
    
    @Override
    void prepare() {
        System.out.println("Fazendo café " + name);
        System.out.println("Colocando " + waterRequired + "ml de água quente");
        System.out.println("Adicionando " + coffeeRequired + "g de café.");
        System.out.println("Servindo o pedido de " + name + ".\n");
    }
}