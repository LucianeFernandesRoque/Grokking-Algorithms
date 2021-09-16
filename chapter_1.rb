#1-Recursividade => objeto que se define em termos de sí próprio,utilizar uma funçao que chama ela mesma
  #-Algoritimo recursivo deve ter um fim
  #-ALgoritimo recursivo deve mudar o seu estado e se aproximar do estado final
  #-Algoritimo recurviso deve chamar a si mesmo recursivamente
#1.2- Tipos de recursividade  
  #-Recursão direta -> Onde a função chama ela mesma
  #-Recursão indireta -> Onde a primeira função chama uma segunda função, que por sua vez chama a primeira função novamente
  #-Função recursiva em cauda --> A chamada da recursividade é a ultima instrução a ser executada(Otimizada pelo compudtador) 
  #-Função non-tail recursive --> Qualquer outro caso que nao tenha taile, a chamada da recursividade não é a ultima instrução
#1.3- Notação Big O estabelece o tempo de execução para pior hipótese
  #-pesquisa simples tem tempo de execução O(n)  
  #Pontos a considerar
  #* A rápidez de um algoritmo não é medida em segundos, mas pelo crescimento do número de operações.
  #* Em vez disso, discutimos sobre o quão rapidamente o tempo de execução de um algoritmo aumenta conforme o numero de elementos aumenta.
  #* O tempo de execução em algoritmos é expresso na notação Bio O.
  #* O (log n) é mais rapído do que O(n), e O(log n) fica ainda mais rapido conforme a lista aumenta
  arr = (0..10000).map{|num| num }

  def bsearch(array, num)
    array.each_with_index.to_a.bsearch { |(x,index)| x >= num }[1]
  end
  
  def bsearch2(array, num, min = 0, max = array.length-1)
    mid = get_mid(min, max)
    return mid if array[mid] == num
    return -1 if max <= min || mid == 0
    array[mid] < num ? bsearch2(array, num, mid, max) : bsearch2(array, num, min, mid)
  end
  
  def get_mid(min, max)
    return 0 if max == 1
    mid = ((max - min)/2.0).ceil + min
  end
  
  def bsearch3(array, num)
    start = 0
    endpoint = array.length - 1
  
    while start <= endpoint
  mid = (start + endpoint) / 2
  
  if array[mid] == num
    return mid
  elsif num < array[mid]
    endpoint = mid - 1
  else
    start = mid + 1
  end
    end
  
    return -1
  end
  
  def index(array, num)
    array.index(num)
  end
  
  
  
  require 'benchmark'
  n = 1000
  Benchmark.bm(20) do |x|
    x.report("Bsearch Pretty:")    { n.times { bsearch(arr,  9999) } }
    x.report("Bsearch Recursive:") { n.times { bsearch2(arr, 9999) } }
    x.report("Bsearch While Loop:"){ n.times { bsearch3(arr, 9999) } }
    x.report("Using .index:")      { n.times { index(arr,    9999) } }
    x.report("Bsearch Pretty:")    { n.times { bsearch(arr,  500) } }
    x.report("Bsearch Recursive")  { n.times { bsearch2(arr, 500) } }
    x.report("Bsearch While Loop:"){ n.times { bsearch3(arr, 500) } }
    x.report("Using .index:")      { n.times { index(arr,    500) } }
    x.report("Bsearch Pretty:")    { n.times { bsearch(arr,  1000) } }
    x.report("Bsearch Recursive")  { n.times { bsearch2(arr, 1000) } }
    x.report("Bsearch While Loop:"){ n.times { bsearch3(arr, 1000) } }
    x.report("Using .index:")      { n.times { index(arr,    1000) } }
  end