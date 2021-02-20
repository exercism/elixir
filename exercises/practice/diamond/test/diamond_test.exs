defmodule DiamondTest do
  use ExUnit.Case

  # @tag :pending
  test "letter A" do
    shape = Diamond.build_shape(?A)
    assert shape == "A\n"
  end

  @tag :pending
  test "letter B" do
    shape = Diamond.build_shape(?B)

    assert shape == """
           \sA\s
           B B
           \sA\s
           """
  end

  @tag :pending
  test "letter C" do
    shape = Diamond.build_shape(?C)

    assert shape == """
           \s A \s
           \sB B\s
           C   C
           \sB B\s
           \s A \s
           """
  end

  @tag :pending
  test "letter D" do
    shape = Diamond.build_shape(?D)

    assert shape == """
           \s  A  \s
           \s B B \s
           \sC   C\s
           D     D
           \sC   C\s
           \s B B \s
           \s  A  \s
           """
  end

  @tag :pending
  test "letter Z" do
    shape = Diamond.build_shape(?Z)

    assert shape == """
           \s                        A                        \s
           \s                       B B                       \s
           \s                      C   C                      \s
           \s                     D     D                     \s
           \s                    E       E                    \s
           \s                   F         F                   \s
           \s                  G           G                  \s
           \s                 H             H                 \s
           \s                I               I                \s
           \s               J                 J               \s
           \s              K                   K              \s
           \s             L                     L             \s
           \s            M                       M            \s
           \s           N                         N           \s
           \s          O                           O          \s
           \s         P                             P         \s
           \s        Q                               Q        \s
           \s       R                                 R       \s
           \s      S                                   S      \s
           \s     T                                     T     \s
           \s    U                                       U    \s
           \s   V                                         V   \s
           \s  W                                           W  \s
           \s X                                             X \s
           \sY                                               Y\s
           Z                                                 Z
           \sY                                               Y\s
           \s X                                             X \s
           \s  W                                           W  \s
           \s   V                                         V   \s
           \s    U                                       U    \s
           \s     T                                     T     \s
           \s      S                                   S      \s
           \s       R                                 R       \s
           \s        Q                               Q        \s
           \s         P                             P         \s
           \s          O                           O          \s
           \s           N                         N           \s
           \s            M                       M            \s
           \s             L                     L             \s
           \s              K                   K              \s
           \s               J                 J               \s
           \s                I               I                \s
           \s                 H             H                 \s
           \s                  G           G                  \s
           \s                   F         F                   \s
           \s                    E       E                    \s
           \s                     D     D                     \s
           \s                      C   C                      \s
           \s                       B B                       \s
           \s                        A                        \s
           """
  end
end
