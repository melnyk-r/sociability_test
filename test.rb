data_questions = File.new("./data/questions.txt","r:UTF-8")
data_results = File.new("./data/results.txt","r:UTF-8")

require_relative "lib/file_reader.rb"
require_relative "lib/game.rb"

# Ввод имени с терминала
name = ARGV[0]
# Выводим обращение в зависимости от наличия имени тестируемого.
if name == nil
  puts "Здравствуйте, таинственная персона."
else
  puts "Здравствуйте, #{name}. Предлагаем определить ваш уровень общительности."
end

puts "                     ВАШ УРОВЕНЬ ОБЩИТЕЛЬНОСТИ"
puts "                     -------------------------"
sleep 1
puts "Тест поможет определить ваш уровень коммуникабельности.
Для этого необходимо правдиво ответить на следующие вопросы."
puts

reader = FileReader.new
questions = reader.read_from_file(data_questions)
results = reader.read_from_file(data_results)

game = Game.new(questions)
until game.finished?
  game.make_questions
end

puts game.return_results(results)
