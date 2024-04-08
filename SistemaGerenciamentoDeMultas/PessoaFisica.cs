public class PessoaFisica : Proprietario
{
    private string CPF;

    public void SetCpf(string cpf)
    {
        bool verifica = Validacoes.VerificarCPF(cpf);

        if(verifica == true)
        {
            this.CPF= cpf;
        }
        else
        {
            verifica = false;
        }
    }

    public string GatCpf()
    {
        return this.CPF;
    }

    public string RG;
    public string dataDeNasc;
    public string sexo;
}