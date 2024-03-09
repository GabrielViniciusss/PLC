package Q1.exec;

import javax.swing.JOptionPane;
import Q1.obj.BoletoBancario;
import Q1.obj.CartaoCredito;
import Q1.obj.PayPal;

public class Main {
    public static void main(String[] args)
    {
        int comando = Integer.parseInt(JOptionPane.showInputDialog("Escolha o método de pagamento desejado:\n1. Cartão de Crédito\n2. Boleto Bancário\n3. Paypal"));
        FormaDePagamento FP;

        switch (comando) {
            case 1:                 //Cartao de Credito

                String senhaCartao = JOptionPane.showInputDialog("Digite a senha do cartão de crédito:");    //usando o JOptionPane aprendido em aula ao inves do scanner
                String codCartao = JOptionPane.showInputDialog("Digite o código de segurança do cartão de crédito:");
                FP = new CartaoCredito(senhaCartao, codCartao);
                FP.autenticar();
                FP.processarPagamento(300.4);
                break;

            case 2:                                         //Boleto bancario
                String codBoleto = JOptionPane.showInputDialog("Digite o código do Boleto:");
                FP = new BoletoBancario(codBoleto);
                FP.autenticar();
                FP.processarPagamento(330);
                break;

            case 3:                                         //PayPal
                String loginPayPal = JOptionPane.showInputDialog("Digite seu login do Paypal:");
                String senhaPaypal = JOptionPane.showInputDialog("Digite sua senha do Paypal:");
                FP = new PayPal(loginPayPal, senhaPaypal);
                FP.autenticar();
                FP.processarPagamento(300);
                break;
                
            default:
                JOptionPane.showMessageDialog(null,"Comando inválido, por favor digite um número de 1 a 3");
                break;
        }
    }
}
