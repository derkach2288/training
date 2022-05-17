# Область видимости в классах
# Поймем еще раз «классовую» область видимости.

# Объявите переменную variable
# После чего объявите класс MyClass и напишите у него конструктор, который создаёт переменную экземпляра @variable
# Напишите у класса метод check_variables, который проверяет объявлены ли переменные variable и @variable
# В основной программе создайте экземпляр класса MyClass и вызовите у него метод check_variables, а потом проверьте 
# объявленность тех же переменных в основном тексте программы.

# Программа, которая проверяет доступность локальных переменных в методах класса


# Определим переменную variable до объявления класса
variable = 1

# Напишем класс, который проверяет наличие переменной a в одном из своих методов
class MyClass
  def initialize
    @variable = 2
  end

  def check_variables
    puts 'В классе:'
    puts "Переменная 'variable': #{defined?(variable)}"
    puts "Переменная '@variable': #{defined?(@variable)}"
  end
end

obj = MyClass.new
obj.check_variables

# Наконец, убедимся, что переменные экземпляров недоступны вне методов класса
puts 'Вне класса:'
puts "Переменная 'variable': #{defined?(variable)}"
puts "Переменная '@variable': #{defined?(@variable)}"