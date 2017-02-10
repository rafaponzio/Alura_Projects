require_relative "contador"

class Estoque
    attr_reader :livros

    def initialize
        @livros = []
        @livros.extend Contador
    end

    def adiciona(livro)
        @livros << livro if livro
    end

    def exporta_csv
        @livros.each { |livro| puts livro.to_csv}
    end

    def mais_barato_que(valor)
        @livros.select {|livro| livro.preco <= valor}
    end

    def total
        @livros.size
    end

    def << (livro)
       @livros << livro if livro
       self
    end

    def remove(livro)
        @livros.delete livro
    end

    def maximo_necessario
        @livros.maximo_necessario
    end
end