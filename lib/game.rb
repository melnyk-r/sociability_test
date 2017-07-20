class Game
  def initialize(questions)
    @questions = questions
    @yes_answers = 0
    @current_question = 0
  end

  # Проверка закончились ли вопросы
  def finished?
    @current_question >= @questions.size
  end

  # Метод задающий вопросы
  def make_questions
    puts @questions[@current_question]

    user_input = nil

    while (user_input != "да" && user_input != "нет" && user_input != "иногда")
      puts "Введите 'да', 'нет' или 'иногда' и нажмите Ввод"
      user_input = STDIN.gets.chomp.downcase
    end

    @current_question += 1

    # Добавление в счетчик зависимо от варианта ответа
    @yes_answers += 2 if user_input == "да"
    @yes_answers += 0 if user_input == "нет"
    @yes_answers += 1 if user_input == "иногда"
  end

  # Вилка результатов
  def return_results(results)
    return results[0] if @yes_answers >= 30
    return results[1] if @yes_answers.between?(25, 29)
    return results[2] if @yes_answers.between?(19, 24)
    return results[3] if @yes_answers.between?(9, 18)
    return results[4] if @yes_answers.between?(4, 8)
    return results[5] if @yes_answers <= 3
  end

end
