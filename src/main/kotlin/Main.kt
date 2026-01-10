package org.example

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
fun main() {
    /***
     * Função que recebe uma lista de faturamentos diarios de uma empresa de todos os dias do ano
     **/
    fun analisarFaturamento(faturamentos: DoubleArray) {
        //utilizamos aqui com valores iniciais para não atrapalhar a comparação
        var menor = Double.MAX_VALUE //aqui temos o maior numero que um double pode representar
        var maior = Double.MIN_VALUE //aqui temos o menor numero que um double pode representar
        var soma = 0.0
        var diasComFaturamento = 0

        // Primeira passada: menor, maior e soma
        for (valor in faturamentos) {
            if (valor > 0) { // ignora dias sem faturamento
                //percorremos cada valor do vetor e comparamos até encontrarmos o maior e o menor
                if (valor < menor) menor = valor
                if (valor > maior) maior = valor
                soma += valor
                diasComFaturamento++
            }
        }

        if (diasComFaturamento == 0) {
            println("Não houve faturamento no ano.")
            return
        }

        val media = soma / diasComFaturamento

        // Segunda passada: dias acima da média
        var diasAcimaDaMedia = 0
        for (valor in faturamentos) {
            if (valor > media) { // com o valor da média em mãos, agora podemos apenas comparar cada valor com ela
                diasAcimaDaMedia++
            }
        }

        println("Menor faturamento do ano: $menor")
        println("Maior faturamento do ano: $maior")
        println("Dias com faturamento acima da média: $diasAcimaDaMedia")
    }

    analisarFaturamento(doubleArrayOf(100.0, 200.0, 300.0, 400.0))
}