package Java.Q6.obj;

public abstract class ProdutoEletronico {       // classe abstrata que representa os produtos
    protected String modelo;
    protected int anoLancamento;
    protected double preco;
    protected String sistemaOperacional;
    protected int quantidadeDisponivel;

    public ProdutoEletronico(String modelo, int anoLancamento, double preco, String sistemaOperacional, int quantidadeDisponivel) {
        this.modelo = modelo;
        this.anoLancamento = anoLancamento;
        this.preco = preco;
        this.sistemaOperacional = sistemaOperacional;
        this.quantidadeDisponivel = quantidadeDisponivel;
    }

    public abstract void exibirInformacoes();   // metodo que os produtos podem implementar ou n
}