package Java.Q5.obj;

public abstract class Pessoa implements Comparable<Pessoa> {     // Classe Pessoa implementa a classe Pessoa que permite ser comparada com outras instancias de Pessoa por meio do compareTo
    private int idade;
    private String nome;

    public Pessoa(int idade, String nome) {         
        this.idade = idade;
        this.nome = nome;
    }

    public String getName() {
        return nome;
    }

    public int getAge() {
        return idade;
    }

    public abstract Ticket getTicketType();      

    @Override                                  // metodo que deve ser implementado para usar a interface Comparable
    public int compareTo(Pessoa pessoa) {
        if (this.idade < pessoa.idade) {                 // pessoa atual < pessoa passada (ordenaçao)
            return -1;
        } else if (this.idade > pessoa.idade) {          // pessoa atual > pessoa passada (ordenaçao)
            return 1;
        } else {
            return 0;
        }
    }

    @Override
    public String toString() {
        return nome + ": " + idade + "[" + getTicketType() + "]";
    }

}


