package Java.Q6.obj;

public class Loja {
    public void venderProduto(ProdutoEletronico produtoEletronico) {
        if (produtoEletronico.quantidadeDisponivel > 0) {
            System.out.println("O seguinte produto foi vendido: \n");
            produtoEletronico.exibirInformacoes();
            produtoEletronico.quantidadeDisponivel--;
        } else {
            System.out.println("Sentimos muito, não há mais estoque de " + produtoEletronico.modelo);
        }
    }
}
