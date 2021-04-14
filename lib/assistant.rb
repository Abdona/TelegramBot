class Assistant
  def initialize; end

  def information
    info = { greeting: 'Hallo', ask_about_age_informal: 'Wie alt bist du?',
             ask_about_age_formal: 'Wie alt sind Sie?' }
    key_index = info.keys
    rand_info = rand(3)
    info[key_index[rand_info]]
  end
end
