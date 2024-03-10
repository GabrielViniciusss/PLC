package Java.Q5.obj;

import java.util.ArrayList;
import java.util.Collections;

public class Queue<T extends Pessoa> {          
    private ArrayList<T> pessoas;

    public Queue(int capacidadeInicial) {
        this.pessoas = new ArrayList<>(capacidadeInicial);
    }

    public void push(T pessoa) {
        pessoas.add(pessoa);
        Collections.sort(pessoas);
        Collections.reverse(pessoas);
    }

    public T pop() {
        if (!pessoas.isEmpty()) {
            return pessoas.remove(0);
        }
        return null;
    }

    public boolean isEmpty() {
        return pessoas.isEmpty();
    }

    public int length() {
        return pessoas.size();
    }
}
