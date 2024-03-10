package Java.Q5.exec;

import Java.Q5.obj.Queue;
import Java.Q5.obj.Pessoa;
import Java.Q5.obj.Adulto;
import Java.Q5.obj.Crianca;

public class Main {
    public static void main(String[] args) {
        Queue<Pessoa> fila = new Queue<>(5);
        
        fila.push(new Adulto(35, "LOUD LESS"));
        fila.push(new Adulto(45, "Biel"));
        fila.push(new Crianca(8, "Doubo"));
        fila.push(new Crianca(6, "Louco"));
        fila.push(new Crianca(3, "Texas"));
        
        int i = fila.length();
        while (!fila.isEmpty()) {
            Pessoa pessoa = fila.pop();
            System.out.println("Pessoa " + i + ": " + pessoa);
            i--;
        }
    }
}
