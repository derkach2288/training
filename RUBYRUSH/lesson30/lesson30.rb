#Д/З Объединяем людей и фильмы. Напишите программу, которая будет использовать одновременно два класса из предыдущих заданий (11-3 и 12-2).

#Добавьте в класс «Человек» поле, хранящее любимый фильм данного человека. В это поле будет записываться объект класса «Фильм».

#Также добавьте в класс «Человек» два метода: один будет записывать значение в это поле, другой будет возвращать текущее значение этого поля.

#Создайте трех людей, каждому из них назначьте (с использованием нового метода) по одному фильму и выведите всех трех людей и их фильмы на экран.


require_relative "person.rb"
require_relative "film.rb"


pers1 = Person.new('Василий', 'Петрович', 65)
pers2 = Person.new('Юрий', 'Иванович', 32)

pers1.film = Film.new('Челюсти', 'Спилберг')
pers2.film = Film.new('Список Шиндлера', 'Спилберг')

pers1.full_name
puts "Его любимый фильм #{pers1.film.title}, режисер #{pers1.film.director_name}"
puts
pers2.full_name
puts "Его любимый фильм #{pers2.film.title}, режисер #{pers2.film.director_name}"