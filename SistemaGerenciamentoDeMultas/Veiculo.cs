public class Veiculo
{
    public int id_Veiculo;
    private string numeroNIV;

    public void SetNiv(string niv)
    {
        bool verifica = Validacoes.ValidacaoNIV(niv);

        if(verifica == true)
        {
            this.numeroNIV= niv;
        }
        else
        {
            verifica= false;
        }
    }

    public string GatNiv()
    {
        return this.numeroNIV;
    }

    public string numeracaoPlaca;
    public string numeracaoMotor;
    public string renavam;
    public string anoModeloFabricacao;
    public string situacao;
    public string cor;
    public Cidade cidadeDeReg;
    public Proprietario dono;
    public Modelo modelo;
}