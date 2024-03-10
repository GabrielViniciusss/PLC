package Java.Q5.obj;

public class Crianca extends Pessoa {
    public Crianca(int idade, String nome) {
        super(idade, nome);
    }

    @Override
    public Ticket getTicketType() {
        return Ticket.CRIANÇA;
    }
}