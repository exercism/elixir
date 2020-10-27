defmodule HighSchoolSweetheart do
  def first_letter(name) do
    String.first(String.trim(name))
  end

  def initial(name) do
    String.upcase(first_letter(name)) <> "."
  end

  def initials(full_name) do
    [first_name, last_name] = String.split(full_name)
    "#{initial(first_name)} #{initial(last_name)}"
  end

  def pair(full_name1, full_name2) do
    i1 = initials(full_name1)
    i2 = initials(full_name2)

    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{i1}  +  #{i2}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
