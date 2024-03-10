package Java.Q5.obj;

public class Adulto extends Pessoa {
    public Adulto(int idade, String nome) {
        super(idade, nome);
    }

    @Override
    public Ticket getTicketType() {
        return Ticket.ADULTO;
    }
}