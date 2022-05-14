
require 'pony'

# Подключаем библиотеку для работы с консолью io/console
require 'io/console'

# ВНИМАНИЕ! Это почта, с которой будет отправлено письмо, замените на свою почту
# и выберите подходящие настройки ниже (для разных провайдеров почты разные
# настройки).
my_mail = 'derkach2288@gmail.com'

# Спрашиваем пароль от почты, с которой будет отправлено письмо. Вместо обычного
# gets используем специальный метод из библиотеки 'io/console', который скрывает
# вводимые символы (чтобы не палить пароль, если вдруг кто-то смотрит).
puts "Введите пароль от вашей почты #{my_mail} для отправки письма:"
password = STDIN.noecho(&:gets).chomp

# Спрашиваем у пользователя адрес электронной почты получателя письма
puts 'Кому отправить письмо? Введите адрес:'
send_to = STDIN.gets.chomp

# Наконец, спрашиваем у пользователя, что написать в письме. Весь введенный
# пользователем текст мы преобразуем в правильную кодировку, чтобы не было
# сюрпризов при использовании русских букв.
puts 'Что написать в письме?'
body = STDIN.gets.encode('UTF-8').chomp
puts 'Какая тема?'
subject = STDIN.gets.encode('UTF-8').chomp

begin

# Отправляем письмо, используя класс Pony из библиотеки pony
Pony.mail(
  subject: subject, # тема письма
  body: body, # текст письма, его тело
  to: send_to, # кому отправить письмо
  from: my_mail, # от кого письмо (наш обратный адрес)

   via: :smtp,
   via_options: {
    address: 'smtp.gmail.com',
    port: '587',
    enable_starttls_auto: true,
    user_name: my_mail,
    password: password,
    authentication: :plain
 }
)


rescue SocketError
    puts "Не могу соединиться с сервером. "
rescue Net::SMTPSyntaxError => error
    puts "Вы некорректно задали параметры письма: " + error.message
rescue Net::SMTPAuthenticationError => error
    puts "Неправильный пароль, попробуйте еще: " + error.message
ensure    # ensure выполняет код при любом раскладе сверху 
    puts "Мы постарались отправить письмо."
end


