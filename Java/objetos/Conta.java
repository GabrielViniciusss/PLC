package objetos;

public class Conta {
    private int conta;
    private double saldo;
    
    public Conta(int x,double saldoInicial)
    {
        conta = x;
        saldo = saldoInicial;
    }
    
    public int getConta()
    {
        return conta;
    }

    public void setConta(int Conta)
    {
        this.conta = Conta;
    }

    public double getSaldo()
    {
        return saldo;
    }

    public void setSaldo(double saldo)
    {
        this.saldo = saldo;
    }

    public void creditar(double x)
    {
        this.saldo+=x;
    }
    
     public void debitar(double x)
    {
        this.saldo-=x;
    }

    public void transferencia(Conta conta, double x)
    {
        boolean flag = true;
        
        if(flag)
        {
            conta.saldo+=x;
            this.saldo-=x;
        }
        //ou
        else
        {
            this.debitar(x);
            conta.creditar(x);
        }
    }
}