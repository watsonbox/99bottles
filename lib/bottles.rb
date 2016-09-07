class Bottles
  def song
    verses(99, 0)
  end

  def verses(start_count, end_count)
    counts = start_count.downto(end_count)
    counts.map(&method(:verse)).join("\n")
  end

  def verse(count)
    [situation_line(count), action_line(count)].map { |l| "#{l}\n"}.join
  end

  private

  def situation_line(count)
    "#{bottle_string(count).capitalize} of beer on the wall, #{bottle_string(count)} of beer."
  end

  def action_line(count)
    if count == 0
      "Go to the store and buy some more, 99 bottles of beer on the wall."
    else
      "Take #{it_or_one(count)} down and pass it around, #{bottle_string(count-1)} of beer on the wall."
    end
  end

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
