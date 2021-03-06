require_relative 'io_adapter'
class Game
  def initialize(character, actions_pool)
    @character = character
    @actions_pool = actions_pool
    @stack = []
  end

  def game_run
    until @character.dead?
      GameMenu.new(@character, @actions_pool)
      value = IOAdapter.instance.input '[Чем занятся Валере?]:'
      next_command = @actions_pool.avaliable_actions(@character)[value]
      unless next_command.nil?
        @stack.push(@character.clone)
        next_command.execute(@character)
      end
      other_actions(value)
    end
    after_death_menu
    game_run
  end

  def other_actions(value)  
    case value
    when 'save'
      SaveOrLoad.new.save(@character)
      IOAdapter.instance.output('Сохранение успешно.')
    when 'load'
      SaveOrLoad.new.load(@character)
      IOAdapter.instance.output 'Загрузка завершена.'
    when 'exit'
      IOAdapter.instance.output 'Увидимся!'
      exit
    end
  end

  def after_death_menu
    # system 'clear'
    IOAdapter.instance.output "\x1B[31m \nВалера помер :'-( \x1B[0m \n"
    IOAdapter.instance.output '[new game] [load] [menu] [exit]'
    value = IOAdapter.instance.input 'Что делать будем?: '
    case value
    when 'new game'
      @character = ValeraInit.new
    when 'load'
      SaveOrLoad.new.load(@character)
    when 'menu'
      Application.new.run
    when 'exit'
      IOAdapter.instance.output 'Увидимся!'
      exit
    else
      after_death_menu
    end
  end
end
