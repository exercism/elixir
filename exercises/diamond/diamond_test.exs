if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("diamond.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule DiamondTest do
  use ExUnit.Case

  # @tag :pending
  test "letter A" do
    shape = Diamond.build_shape(?A)
    assert shape == "A\n"
  end

  @tag :pending
  test "letter C" do
    shape = Diamond.build_shape(?C)
    assert shape == """
\s A  
\sB B 
 C   C
\sB B 
\s A  
    """
  end

  @tag :pending
  test "letter E" do
    shape = Diamond.build_shape(?E)
    assert shape == """
\s   A    
\s  B B   
\s C   C  
\sD     D 
 E       E
\sD     D 
\s C   C  
\s  B B   
\s   A    
    """
  end
end
