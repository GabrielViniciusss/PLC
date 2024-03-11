package Java.Q6.exec;

import Java.Q6.obj.Loja;
import Java.Q6.obj.Notebook;
import Java.Q6.obj.Smartphone;
import Java.Q6.obj.Tablet;

public class Main {
    public static void main(String[] args) {

        Loja loja = new Loja();

        Smartphone smartphone = new Smartphone("iphone 15", 2022, 3999.99, "IOS", 5);
        Tablet tablet = new Tablet("tablet da shopee", 2021, 99.99, "iOS", 4);
        Notebook notebook = new Notebook("ACER NITRO 5", 2020, 3999.99, "Windows", 0, true);

        // Simulação de venda dos produtos
        loja.venderProduto(smartphone);
        loja.venderProduto(tablet);
        loja.venderProduto(notebook);
    }
}
