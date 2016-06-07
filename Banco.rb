# Un banco utiliza el siguiente formato en sus números de cuenta: "1234-123-123"

# Crea los siguientes métodos que reciban un string y piensa bien como nombrar a cada uno. adicional Deberás crear cuatro pruebas en el Driver Code para cada método.

# Métodos:

# Regresa true si encuentra un numero de cuenta.
# Regresa un numero de cuenta si existe dentro del string y nil en el caso contrario.
# Regresa un array con los números de cuenta que existen dentro del string y un array vacío en el caso contrario.
# Regresa un string donde si existen números de cuenta estos tendran remplazados por "X" los primeros siete numeros. ej. "XXXX-XXX-234"
# Regresa un string formateado donde cualquier número de diez dígitos seguido o si tiene puntos en vez de guiones lo regresa a su formato 
# original donde usa guiones para dividir los diez dígitos. Si encuentra un numero de menos dígitos no debería remplazarlo.


def numero? (string)
  a = string.match(/\d{4}\-\d{3}-\d{3}/) 
  unless a == nil
    true
  else
    false
  end
end


def num_cta (string)
  a = string.match(/\d{4}\-\d{3}-\d{3}/)
  unless a == nil
    a.to_s
  else
    nil
  end
end

def num_ctas (string)
  arr=[]
  arr = string.split(" ").map{|x| x if numero?(x)} #.match(/\d{4}\-\d{3}-\d{3}/)
  arr.compact!
end

def censura(string)
  num_ctas(string).map!{|x| 'XXXX-XXX-' + x[9..-1]}
end

def find_cta(string)
  unless string.match(/\d{10}/) == nil
    # string.gsub!(/\d{10}/){|s| s[0..3]+ '-' + s[4..6]+ '-' + s[7..9]}
    string.gsub!(/(\d{4})(\d{3})(\d{3})/, '\1-\2-\3')
  end
  unless string.match(/\d{4}.\d{3}.\d{3}/) == nil
    string.gsub!('.', '-')
  else
    string
  end
end

p find_cta("el numero de cuenta es 1234.123.123 1334123125")
