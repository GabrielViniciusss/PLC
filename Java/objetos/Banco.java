package objetos;

public class Banco 
{
    private Conta[] contas;
    private int indice = 0;

    public void Banco()
    {
        contas = new Conta[100];
    }

    public void cadastrarConta (Conta c)
    {
        contas[indice] = c;
        indice++;
    }
    
    public void creditar (int conta,double saldo)
    {
        for(int i =0;i<indice;i++)
        {
            if(contas[i].getConta() == conta)
            {
                contas[i].creditar(saldo);
                break;
            }
        }
    }

    public void debitar (int conta,double saldo)
    {
        for(int i =0;i<indice;i++)
        {
            if(contas[i].getConta() == conta)
            {
                contas[i].debitar(saldo);
                break;
            }
        }
    }

    public double getsaldo (int conta)
    {
        for(int i =0;i<indice;i++)
        {
            if(contas[i].getConta() == conta)
            {
                return contas[i].getSaldo();
            }
        }
        return 0;
    }

}