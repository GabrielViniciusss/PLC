package Q1.exec;

public interface FormaDePagamento {
    boolean autenticar();
    void processarPagamento(double valor);
}



