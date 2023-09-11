<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gerador de Palpites da MegaSena - PHP</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <form method="post" action="sena.php">
            <table style="width:100%" cellpadding="6">
                <caption>
                    <h1>ENTRE COM DADOS PARA GERAR PALPITES</h1>
                </caption>
                <tr>
                    <td>
                        Entre com a quantidade de Dezenas cada jogo :
                    </td>
                    <td>
                        <input type="text" id="jogos" size="20" name="jogos">
                        min 1
                    </td>
                </tr>

                <tr>
                    <td>
                        Entre com a quantidade de Dezenas cada jogo :
                    </td>
                    <td>
                        <input type="text" id="dezenas" size="20" name="dezenas">
                        min 6 - max 15
                    </td>
                </tr>
                <td style="text-align:right"></td>
                <tr>
                    <th>
                        <input type="submit" value="Processar palpites">
                    </th>
                </tr>
            </table>
        </form>
    </body>
</html>
