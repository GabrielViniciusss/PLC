package Q1.obj;

import javax.swing.JOptionPane;
import Q1.exec.FormaDePagamento;

class PayPalClient {

    public String login,senha;
    
    public PayPalClient(String login, String senha)
    {
        this.login = login;
        this.senha = senha;
    }
}

public class PayPal implements FormaDePagamento {
    private String login;
    private String senha;
    private boolean flag = false;

    PayPalClient[] clients = new PayPalClient[]
    {
        new PayPalClient("biel","123"),
        new PayPalClient("hahaha","321"),
        new PayPalClient("neves","123")
    };

    public PayPal(String login2, String senha2) {     //Construtor da classe
        this.login = login2;
        this.senha = senha2;
    }

    @Override                                                   // sobreescre o metodo autenticar() da interface FormaDePagamento para o caso de Paypal  
    public boolean autenticar() {                                                           
        flag = false;

        for(int i = 0;i<clients.length;i++)
        {
            if(clients[i].login.equals(login) && clients[i].senha.equals(senha))
            {
                flag = true;
                break;
            }
        }
        if(flag)
            JOptionPane.showMessageDialog(null, "Autenticacao bem sucedida");

        return flag;
    }

    @Override                                                  // sobreescre o metodo autenticar() da interface FormaDePagamento para o caso de Paypal
    public void processarPagamento(double valor) {  
        if (!flag) {
            JOptionPane.showMessageDialog(null, "Pagamento não autorizado: autenticação falhou.");
        }
        else
            JOptionPane.showMessageDialog(null,"Pagamento com PayPal no valor de " + valor + " processado com sucesso");
    }
}
