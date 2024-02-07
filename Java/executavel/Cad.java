package executavel;

import objetos.Conta;
import objetos.Banco;
import javax.swing.JOptionPane;

public class Cad {
    public static void main (String[] args)
    {

        Conta c = new Conta(0,0.0);
        Conta c2 = new Conta(0,0.0);
        Conta poup = new Conta(0,0.0);

        poup.setConta(Integer.parseInt(JOptionPane.showInputDialog("Conta Poupanca:")));
        poup.setSaldo(Double.parseDouble(JOptionPane.showInputDialog("Saldo da Poupança: ")));
        
        c.setConta(Integer.parseInt(JOptionPane.showInputDialog("Conta C1:")));
        c.setSaldo(Double.parseDouble(JOptionPane.showInputDialog("Saldo da conta1: ")));

        c2.setConta(Integer.parseInt(JOptionPane.showInputDialog("Conta C2:")));
        c2.setSaldo(Double.parseDouble(JOptionPane.showInputDialog("Saldo da conta2: ")));
        
        //c.transferencia(c2,Double.parseDouble(JOptionPane.showInputDialog("Valor a ser transferido: ")));

        //c.creditar(Double.parseDouble(JOptionPane.showInputDialog("Digite o valor a ser creditado: ")));
        // System.out.println(c.getConta() + " " + c.getSaldo());

        Banco banco = new Banco();
        banco.cadastrarConta(c);
        banco.cadastrarConta(c2);
        banco.cadastrarConta(poup);

        /* 
        int conta1 = c.getConta();
        double saldo1 = c.getSaldo();
        
        int conta2 = c2.getConta();
        double saldo2 = c2.getSaldo();

        int conta3 = poup.getConta();
        double saldo3 = poup.getSaldo();
        */

        banco.creditar(1, 200);
        banco.creditar(2, 300);
        banco.creditar(3,400);

        banco.debitar(1, 100);
        banco.debitar(2, 100);
        banco.debitar(3,100);

        double saldo1 = banco.getsaldo(1);
        double saldo2 = banco.getsaldo(2);
        double saldo3 = banco.getsaldo(3);

        System.out.println(saldo1 + "\n" + saldo2 + "\n" + saldo3);

       //JOptionPane.showMessageDialog(null,"Conta Poupança: " + "\n" + conta3 + "\n" + "Saldo Poupança: " + saldo3 + "\n" + "Conta1: " + conta1 + "\n" + "Saldo1: " + saldo1 + "\n" + "Conta2: "+ conta2 + "\n" + "Saldo2: " + saldo2);
    }
}