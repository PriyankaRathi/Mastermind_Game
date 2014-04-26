module GamesHelper
  def pluralize_sentence(count, i18n_id, plural_i18n_id = nil)
    if count <= 1
      I18n.t(i18n_id, :count => count)
    else
      I18n.t(plural_i18n_id || (i18n_id + "_plural"), :count => count)
    end
  end

  def add_correct_guess_on_losing game
    correct_color_scheme = game.target_guess_number.chars
    game.guesses.create!(:first_color => correct_color_scheme[0], :second_color => correct_color_scheme[1], :third_color => correct_color_scheme[2], :fourth_color => correct_color_scheme[3])
  end
end
