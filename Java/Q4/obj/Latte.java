package Java.Q4.obj;

public class Latte extends Coffee{
    public Latte(){
        this.name = "Latte";
        this.waterRequired = 43;
        this.milkRequired = 45;
        this.coffeeRequired = 54;
    }
    
    @Override
    void prepare() {
        System.out.println("Fazendo café " + name);
        System.out.println("Colocando " + waterRequired + "ml de água quente");
        System.out.println("Adicionando " + coffeeRequired + "g de café.");
        System.out.println("Servindo o pedido de " + name + ".\n");
    }
}
