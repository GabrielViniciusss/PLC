package Java.Q4.obj;

public class Expresso extends Coffee{
    public Expresso(){
        this.name = "Expresso";
        this.waterRequired = 30;
        this.milkRequired = 0;
        this.coffeeRequired = 30;
    }
    
    @Override
    void prepare() {
        System.out.println("Fazendo café " + name);
        System.out.println("Colocando " + waterRequired + "ml de água quente");
        System.out.println("Adicionando " + coffeeRequired + "g de café.");
        System.out.println("Servindo o pedido de " + name + ".\n");
    }
}
