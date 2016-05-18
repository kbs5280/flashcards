class Flashcards

  def questions
    @user_choice = File.read(ARGV[0])
  end
end
