def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year FROM books
  JOIN series ON series.id = books.series_id
  WHERE series.id = 1
  ORDER BY year"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto FROM characters
  GROUP BY motto
  HAVING MAX(length(motto)) = length(motto)
  LIMIT 1"
end

def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species) as species_count FROM characters
  GROUP BY species
  ORDER BY COUNT(SPECIES) DESC
  LIMIT 1"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name FROM series
  JOIN subgenres ON series.subgenre_id = subgenre_id
  JOIN authors ON series.author_id = authors.id
  WHERE series.subgenre_id = subgenres.id
  GROUP BY authors.name"
end

def select_series_title_with_most_human_characters
  "SELECT series.title FROM series
  JOIN characters ON characters.series_id = series.id
  GROUP BY series.title
  ORDER BY characters.species = 'humans' DESC
  LIMIT 1"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(books.id) AS books_count FROM characters
  JOIN character_books ON character_books.character_id = characters.id
  JOIN books ON character_books.book_id = books.id
  GROUP BY characters.name
  ORDER BY COUNT(books.id) DESC"
end
