package Q1.obj;

import javax.swing.JOptionPane;
import Q1.exec.FormaDePagamento;

class BoletoBancarioClient{

    public String cod;
    
    public BoletoBancarioClient(String cod)
    {
        this.cod = cod;
    }
}

public class BoletoBancario implements FormaDePagamento {

    private String codigoBoleto;
    private boolean flag = false;

    BoletoBancarioClient[] clients = new BoletoBancarioClient[]
        {
            new BoletoBancarioClient("1234"),
            new BoletoBancarioClient("4321"),
            new BoletoBancarioClient("333")
        };
    
    public BoletoBancario(String cod) {  //construtor da classe
        this.codigoBoleto = cod;
    }

    @Override                                    // sobreescre o metodo autenticar() da interface FormaDePagamento para o caso de Boleto
    public boolean autenticar() {
        flag = false;
        for(int i = 0;i<clients.length;i++)
        {
            if(clients[i].cod.equals(codigoBoleto))
            {
                flag = true;
                break;
            }
        }
        if(flag)
            JOptionPane.showMessageDialog(null, "Autenticacao bem sucedida");

        return flag;
    }

    @Override                                            // sobreescre o metodo processarPagamento da interface FormaDePagamento para o caso de Boleto
    public void processarPagamento(double valor) {
        if (!flag) {
            JOptionPane.showMessageDialog(null, "Pagamento não autorizado: autenticação falhou.");
        }
        else
            JOptionPane.showMessageDialog(null,"Pagamento com boleto bancário no valor de " + valor + " processado com sucesso");
    }
}