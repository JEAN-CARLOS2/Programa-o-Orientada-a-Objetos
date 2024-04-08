PessoaFisica PF = new PessoaFisica();


string cpf;

Console.WriteLine("<<<->>>-<<<->>>-<<<->>>-<<<->>>-<<<->>>-<<<->>>");
Console.WriteLine("Digite um CPF: "); 
cpf = Console.ReadLine();             
cpf = cpf.Replace(".", "").Replace("-", "");

PF.SetCpf(cpf);
Console.WriteLine(PF.GatCpf());      
Console.WriteLine("<<<->>>-<<<->>>-<<<->>>-<<<->>>-<<<->>>-<<<->>>");


/*bool vcpf = Validacoes.VerificarCPF(cpf);
Console.WriteLine(vcpf);*/


Veiculo Caracteristicas = new Veiculo();

string niv;
Console.WriteLine(" ");
Console.WriteLine(" ");
Console.WriteLine("<<<->>>-<<<->>>-<<<->>>-<<<->>>-<<<->>>-<<<->>>");
Console.WriteLine("Digite o número do NIV: ");
Console.WriteLine("OBSERVAÇÕES:");
Console.WriteLine("Número de NIV CONTÉM 17 caracteres;");
Console.WriteLine("NÃO USAR as letras: 'O', 'I' e 'Q';");
Console.WriteLine("OS ÚLTIMOS 4 caracteres DEVEM ser NÚMEROS.");
niv = Console.ReadLine();

Caracteristicas.SetNiv(niv);
Console.WriteLine(Caracteristicas.GatNiv());
Console.WriteLine("<<<->>>-<<<->>>-<<<->>>-<<<->>>-<<<->>>-<<<->>>");


/*bool vniv = Validacoes.ValidacaoNIV(niv);
Console.WriteLine(vniv);*/
