package Q1.obj;

import javax.swing.JOptionPane;
import Q1.exec.FormaDePagamento;

class CartaoCreditoClient {

    public String senha,cod;
    public CartaoCreditoClient(String senha, String cod)
    {
        this.senha = senha;
        this.cod = cod;
    }
}

public class CartaoCredito implements FormaDePagamento {

    private String senha;
    private String codigoSeguranca;
    private boolean flag = false;

    CartaoCreditoClient[] clients = new CartaoCreditoClient[]
        {
            new CartaoCreditoClient("1234","123"),
            new CartaoCreditoClient("4321","321"),
            new CartaoCreditoClient("321","1234")
        };

    public CartaoCredito(String senha2, String cod2) {        //construtor da classe
        this.senha = senha2;
        this.codigoSeguranca = cod2;
    }
    
    @Override                                                  // sobreescre o metodo autenticar() da interface FormaDePagamento para o caso de Cartao de credito
    public boolean autenticar() {
        flag = false;
        for(int i = 0;i<clients.length;i++)
        {
            if(clients[i].senha.equals(senha) && clients[i].cod.equals(codigoSeguranca))
            {
                flag = true;
                break;
            }
        }
        if(flag)
            JOptionPane.showMessageDialog(null, "Autenticacao bem sucedida");

        return flag;
    }

    @Override                                                   // sobreescre o metodo processarPagamento da interface FormaDePagamento para o caso de Cartao de credito        
    public void processarPagamento(double valor) {
        if (!flag) {
            JOptionPane.showMessageDialog(null, "Pagamento não autorizado: autenticação falhou.");
        }
        else
            JOptionPane.showMessageDialog(null,"Pagamento com cartão de crédito no valor de " + valor + " processado com sucesso");
    }
}

