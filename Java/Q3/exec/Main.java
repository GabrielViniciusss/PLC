package Java.Q3.exec;

import Java.Q3.obj.Membro;
import Java.Q3.obj.Lider;
import Java.Q3.obj.Tarefa;
import java.util.List;
import java.util.ArrayList;

class Main{
    public static void main(String[] args)
    {
        Membro m1 = new Membro("Biel");
        Membro m2 = new Membro("Joao");
        Membro m3 = new Membro("Doubo");

        Lider l1 = new Lider("Luis");
        Lider l2 = new Lider("Texas");

        Tarefa<Membro> task1 = new Tarefa<>("Desenvolvimento de código",m1);
        Tarefa<Membro> task2 = new Tarefa<>("Correção de Bugs",m2);
        Tarefa<Membro> task3 = new Tarefa<>("Revisao de código",m3);

        Tarefa<Lider> task4 = new Tarefa<>("Revisao de código",l1);
        Tarefa<Lider> task5 = new Tarefa<>("Liderar",l1);

        List<Tarefa<Membro>> tarefasMembro = new ArrayList<>();
        tarefasMembro.add(task1);
        tarefasMembro.add(task2);
        tarefasMembro.add(task3);

        List<Tarefa<Lider>> tarefasLider = new ArrayList<>();
        tarefasLider.add(task4);
        tarefasLider.add(task5);

        int cargaM1 = Tarefa.calcularCargaDeTrabalho(tarefasMembro,m1); 
        int cargaM2 = Tarefa.calcularCargaDeTrabalho(tarefasMembro,m2); 
        int cargaM3 = Tarefa.calcularCargaDeTrabalho(tarefasMembro,m3);
        
        int cargaL1 = Tarefa.calcularCargaDeTrabalho(tarefasLider,l1);
        int cargaL2 = Tarefa.calcularCargaDeTrabalho(tarefasLider,l2);

        System.out.println("Carga de trabalho de " + m1.getNome() + ": " + cargaM1+"\n");
        System.out.println("Carga de trabalho de " + m2.getNome() + ": " + cargaM2+"\n");
        System.out.println("Carga de trabalho de " + m3.getNome() + ": " + cargaM3+"\n");

        System.out.println("Carga de trabalho de " + l1.getNome() + ": " + cargaL1+"\n");
        System.out.println("Carga de trabalho de " + l2.getNome() + ": " + cargaL2+"\n");
    }
}