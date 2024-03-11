package Java.Q6.obj;

public class Notebook extends ProdutoEletronico {
    private boolean isTouchScreen;

    public Notebook(String modelo, int anoLancamento, double preco, String sistemaOperacional, int quantidadeDisponivel, boolean isTouchScreen) {
        super(modelo, anoLancamento, preco, sistemaOperacional, quantidadeDisponivel);
        this.isTouchScreen = isTouchScreen;
    }

    @Override
    public void exibirInformacoes() {
        System.out.println("Notebook: " + modelo + "\nAno de Lançamento: " + anoLancamento + "\nPreço: " + preco + "\nSistema Operacional: " + sistemaOperacional + "\nQuantidade Disponível: " + quantidadeDisponivel + "\nTouch Screen: " + isTouchScreen + "\n");
    }
}
