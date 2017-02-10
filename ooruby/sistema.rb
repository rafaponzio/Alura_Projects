require_relative "livro"
require_relative "estoque"



class Conversor
    def string_para_alfanumerico(nome)
        nome.gsub /[^\w\s]/,''
    end
end

class Float
    def para_dinheiro
        valor = "R$" << self.to_s.tr('.', ',')
        valor << "0" unless valor.match /(.*)(\d{2})$/
        valor
    end
end



def livro_para_newsletter(livro)
    if livro.ano_lancamento < 1999
        puts "Newsletter/Liquidacao"
        puts livro.titulo
        puts livro.preco
    end
end

algoritmos = Livro.new("Algoritmos", 100, 1998, true)
arquitetura = Livro.new("Introdução À Arquitetura e Design de Software", 70, 2011, true)
programmer = Livro.new("The Pragmatic Programmer", 100, 1999, true)
ruby = Livro.new("Programming Ruby", 100, 2004, true)

estoque = Estoque.new
estoque <<  algoritmos
puts estoque.maximo_necessario
estoque <<  arquitetura
puts estoque.maximo_necessario
estoque <<  programmer << ruby
puts estoque.maximo_necessario

estoque.remove algoritmos
puts estoque.maximo_necessario

