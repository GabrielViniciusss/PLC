package Java.Q6.obj;

public class Smartphone extends ProdutoEletronico {
    public Smartphone(String modelo, int anoLancamento, double preco, String sistemaOperacional, int quantidadeDisponivel) {
        super(modelo, anoLancamento, preco, sistemaOperacional, quantidadeDisponivel);
    }

    @Override
    public void exibirInformacoes() {
        System.out.println("Smartphone: " + modelo + "\nAno de Lançamento: " + anoLancamento + "\nPreço: " + preco + "\nSistema Operacional: " + sistemaOperacional + "\nQuantidade Disponível: " + quantidadeDisponivel + "\n");
    }
}
