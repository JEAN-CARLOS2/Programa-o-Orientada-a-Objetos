public static class Validacoes
{
    public static bool VerificarCPF(string cpf)
    {
        if (cpf.Length != 11)
        {
            //Console.WriteLine("Quantidade de caracteres inválidos.");
            return false;
        }


            int c1 = Convert.ToInt32(cpf[0].ToString());
            int c2 = Convert.ToInt32(cpf[1].ToString());
            int c3 = Convert.ToInt32(cpf[2].ToString());
            int c4 = Convert.ToInt32(cpf[3].ToString());
            int c5 = Convert.ToInt32(cpf[4].ToString());
            int c6 = Convert.ToInt32(cpf[5].ToString());
            int c7 = Convert.ToInt32(cpf[6].ToString());
            int c8 = Convert.ToInt32(cpf[7].ToString());
            int c9 = Convert.ToInt32(cpf[8].ToString());
            int c10 = Convert.ToInt32(cpf[9].ToString());
            int c11 = Convert.ToInt32(cpf[10].ToString());

            int digito1 = ((c1 * 10) +
                           (c2 * 9) +
                           (c3 * 8) +
                           (c4 * 7) +
                           (c5 * 6) +
                           (c6 * 5) +
                           (c7 * 4) +
                           (c8 * 3) +
                           (c9 * 2)
                           ) % 11;

            int digito2 = ((c1 * 11) +
                         (c2 * 10) +
                         (c3 * 9) +
                         (c4 * 8) +
                         (c5 * 7) +
                         (c6 * 6) +
                         (c7 * 5) +
                         (c8 * 4) +
                         (c9 * 3) +
                         (c10 * 2)
                         ) % 11;


            if (digito1 != c10 || digito2 != c11)
            {

                if (digito1 < 2 && digito2 >= 2)
                {
                    digito1 = 0;
                    digito2 = 11 - digito2;
                }
                else if (digito1 >= 2 && digito2 < 2)
                {
                    digito1 = 11 - digito1;
                    digito2 = 0;

                }
                else if (digito1 >= 2 && digito2 >= 2)
                {
                    digito1 = 11 - digito1;
                    digito2 = 11 - digito2;    

                }
              
                if (digito1 != Convert.ToInt32(cpf[9].ToString()) || digito2 != Convert.ToInt32(cpf[10].ToString()))
                {
                    //Console.WriteLine("CPF inválido - Dígitos finais incorretos.");
                    return false;
                }

            }
           

        return true;
    }


    public static bool ValidacaoNIV(string niv)
    {
        if (niv.Length != 17)
        {
            Console.WriteLine("Falta caracteres!");
            return false;
        }

        foreach (char c in niv)
        {
            if (c == 'O' || c == 'I' || c == 'Q')
            {
/*                Console.WriteLine("Letras invalidas");
*/                return false;
            }
        }

       
        string c14 = niv[13].ToString();
        string c15 = niv[14].ToString();
        string c16 = niv[15].ToString();
        string c17 = niv[16].ToString();

        

        string alfabeto = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        string numeros = "1234567890";

        

        if (!numeros.Contains(niv[13]) || !numeros.Contains(niv[14]) || !numeros.Contains(niv[15]) || !numeros.Contains(niv[16]))
        {
/*            Console.WriteLine("Os últimos digitos devem ser números");
*/            return false;
            
        }
        else if (!alfabeto.Contains(niv[13]) || !alfabeto.Contains(niv[14]) || !alfabeto.Contains(niv[15]) || !alfabeto.Contains(niv[16]))
        {
/*            Console.WriteLine("NIV válido");
*/            return true;
        }
        


        return true;
    }
}