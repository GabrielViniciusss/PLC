package Java.Q3.obj;
import java.util.List;

public class Tarefa<T> {                       //classe generica de tipo T, posso reutilizar o código de tarefa para diferentes tipos(classes), por ex Lider e Membro
    private String descricao;
    private T responsavel;

    public Tarefa(String desc, T resp) {
        this.descricao = desc;
        this.responsavel = resp;
    }

    public T getResponsavel() {
        return responsavel;
    }

    public String getDesc() {
        return descricao;
    }

    public static <T> int calcularCargaDeTrabalho(List<Tarefa<T>> tarefas, T membro) {
        int cargaTotal = 0;
        for (Tarefa<T> tarefa : tarefas) {                           // loop for-each, percorre a lista tarefas e atribui o elemento atual a Tarefa<T> tarefa
            if (tarefa.getResponsavel().equals(membro)) {
                cargaTotal++;
            }
        }
        return cargaTotal;
    }
}