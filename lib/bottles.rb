module Utils
  def bottle_string(count)
    "#{no_more_or_count(count)} #{bottle_or_bottles(count)}"
  end

  def it_or_one(count)
    count == 1 ? "it" : "one"
  end

  def bottle_or_bottles(count)
    count == 1 ? "bottle" : "bottles"
  end

  def no_more_or_count(count)
    count == 0 ? "no more" : count
  end
end

class Line
  include Utils
end

class SituationLine < Line
  def generate(count)
    "#{bottle_string(count).capitalize} of beer on the wall, #{bottle_string(count)} of beer."
  end
end

class ActionLine < Line
  def generate(count)
    if count == 0
      return "Go to the store and buy some more, 99 bottles of beer on the wall."
    end

    "Take #{it_or_one(count)} down and pass it around, #{bottle_string(count-1)} of beer on the wall."
  end
end

class Verse
  def generate(count)
    [SituationLine, ActionLine].map { |klass| "#{klass.new.generate(count)}\n"}.join
  end
end

class Bottles
  def song
    verses(99, 0)
  end

  def verses(start_count, end_count)
    start_count.downto(end_count).map(&method(:verse)).join("\n")
  end

  def verse(count)
    Verse.new.generate(count)
  end
end
