class WordReader            # Класс WordReader, отвечающий за чтение слова для игры.
    # Так как, подобно классу ResultPrinter, экземляр этого класса не хранит
  # в себе никаких данных, конструктор отсутствует.

  # Сохраним старую возможность читать слово из аргументов командной строки. В
  # качестве отедльного метода read_from_args для обратной совместимости.

    def read_from_file(file_name)     # Метод read_from_file, возвращающий случайное слово, прочитанное из файла,
                                      # имя которого нужно передать методу в качестве единственного аргумента.
        if File.exist?(file_name)
            f = File.new(file_name, 'r:UTF-8')
            lines = f.readlines
            f.close
            return lines.sample.chomp   # Возвращаем случайную строчку (слово) из прочитанного массива, не забывая
                                        # удалить в конце символ перевода строки методом chomp.
        else
            return nil
        end

    end

end