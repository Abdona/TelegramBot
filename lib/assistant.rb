require_relative 'google_translate'
class Assistant
  def information
    info = { greeting: 'Hallo', ask_about_age_informal: 'Wie alt bist du?',
             ask_about_age_formal: 'Wie alt sind Sie?' }
    key_index = info.keys
    rand_info = rand(3)
    [info[key_index[rand_info]], key_index[rand_info]]
  end

  def translate(param)
    de_translate = Translate.new
    de_translate.to_german(param)
  end
end
