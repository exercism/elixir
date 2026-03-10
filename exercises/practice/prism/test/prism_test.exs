defmodule PrismTest do
  use ExUnit.Case

  # @tag :pending
  test "zero prisms" do
    prisms = []
    start = %{angle: 0, x: 0, y: 0}
    assert Prism.find_sequence(prisms, start) == []
  end

  @tag :pending
  test "one prism one hit" do
    prisms = [%{id: 1, angle: 0, x: 10, y: 0}]
    start = %{angle: 0, x: 0, y: 0}
    assert Prism.find_sequence(prisms, start) == [1]
  end

  @tag :pending
  test "one prism zero hits" do
    prisms = [%{id: 1, angle: 0, x: -10, y: 0}]
    start = %{angle: 0, x: 0, y: 0}
    assert Prism.find_sequence(prisms, start) == []
  end

  @tag :pending
  test "going up zero hits" do
    prisms = [
      %{id: 3, angle: 0, x: 0, y: -10},
      %{id: 1, angle: 0, x: -10, y: 0},
      %{id: 2, angle: 0, x: 10, y: 0}
    ]

    start = %{angle: 90, x: 0, y: 0}
    assert Prism.find_sequence(prisms, start) == []
  end

  @tag :pending
  test "going down zero hits" do
    prisms = [
      %{id: 1, angle: 0, x: 10, y: 0},
      %{id: 2, angle: 0, x: 0, y: 10},
      %{id: 3, angle: 0, x: -10, y: 0}
    ]

    start = %{angle: -90, x: 0, y: 0}
    assert Prism.find_sequence(prisms, start) == []
  end

  @tag :pending
  test "going left zero hits" do
    prisms = [
      %{id: 2, angle: 0, x: 0, y: 10},
      %{id: 3, angle: 0, x: 10, y: 0},
      %{id: 1, angle: 0, x: 0, y: -10}
    ]

    start = %{angle: 180, x: 0, y: 0}
    assert Prism.find_sequence(prisms, start) == []
  end

  @tag :pending
  test "negative angle" do
    prisms = [
      %{id: 1, angle: 0, x: 0, y: -10},
      %{id: 2, angle: 0, x: 0, y: 10},
      %{id: 3, angle: 0, x: 10, y: 0}
    ]

    start = %{angle: -180, x: 0, y: 0}
    assert Prism.find_sequence(prisms, start) == []
  end

  @tag :pending
  test "large angle" do
    prisms = [%{id: 1, angle: 0, x: 10, y: 0}]
    start = %{angle: 2340, x: 0, y: 0}
    assert Prism.find_sequence(prisms, start) == []
  end

  @tag :pending
  test "upward refraction two hits" do
    prisms = [
      %{id: 1, angle: 0, x: 10, y: 10},
      %{id: 2, angle: 90, x: 10, y: 0}
    ]

    start = %{angle: 0, x: 0, y: 0}
    assert Prism.find_sequence(prisms, start) == [2, 1]
  end

  @tag :pending
  test "downward refraction two hits" do
    prisms = [
      %{id: 1, angle: -90, x: 10, y: 0},
      %{id: 2, angle: 0, x: 10, y: -10}
    ]

    start = %{angle: 0, x: 0, y: 0}
    assert Prism.find_sequence(prisms, start) == [1, 2]
  end

  @tag :pending
  test "same prism twice" do
    prisms = [
      %{id: 2, angle: 0, x: 10, y: 0},
      %{id: 1, angle: -180, x: 20, y: 0}
    ]

    start = %{angle: 0, x: 0, y: 0}
    assert Prism.find_sequence(prisms, start) == [2, 1, 2]
  end

  @tag :pending
  test "simple path" do
    prisms = [
      %{id: 3, angle: 45, x: 30, y: 10},
      %{id: 1, angle: -90, x: 10, y: 10},
      %{id: 2, angle: 90, x: 10, y: 0},
      %{id: 4, angle: 0, x: 20, y: 0}
    ]

    start = %{angle: 0, x: 0, y: 0}
    assert Prism.find_sequence(prisms, start) == [2, 1, 3]
  end

  @tag :pending
  test "multiple prisms floating point precision" do
    prisms = [
      %{id: 26, angle: 6.555, x: 5.8, y: 73.4},
      %{id: 24, angle: -0.304, x: 36.2, y: 65.2},
      %{id: 20, angle: 45.17, x: 20.4, y: 82.8},
      %{id: 31, angle: 30.615, x: -20.2, y: 48.8},
      %{id: 30, angle: 28.771, x: 24.0, y: 0.6},
      %{id: 29, angle: 61.327, x: 31.4, y: 79.4},
      %{id: 28, angle: -18.157, x: 36.4, y: 31.4},
      %{id: 22, angle: 54.745, x: 47.0, y: 57.8},
      %{id: 38, angle: 49.05, x: 36.4, y: 79.2},
      %{id: 10, angle: 11.978, x: 37.8, y: 55.2},
      %{id: 18, angle: 22.661, x: -26.0, y: 42.6},
      %{id: 25, angle: 51.958, x: 38.8, y: 76.2},
      %{id: 2, angle: -21.817, x: 0.0, y: 42.4},
      %{id: 35, angle: -171.579, x: 21.4, y: 44.8},
      %{id: 7, angle: 19.081, x: 14.2, y: -1.6},
      %{id: 33, angle: -165.941, x: 11.2, y: 44.4},
      %{id: 11, angle: 66.262, x: 15.4, y: 82.6},
      %{id: 16, angle: 35.852, x: 30.8, y: 6.6},
      %{id: 15, angle: 53.782, x: -3.0, y: 79.2},
      %{id: 4, angle: 17.016, x: 29.0, y: 75.4},
      %{id: 23, angle: 70.763, x: 41.6, y: 59.8},
      %{id: 8, angle: -9.24, x: -10.0, y: 15.8},
      %{id: 13, angle: 45.812, x: 48.6, y: 51.8},
      %{id: 1, angle: 17.937, x: 13.2, y: 77.0},
      %{id: 34, angle: -4.199, x: -8.8, y: 36.8},
      %{id: 21, angle: 20.783, x: 24.4, y: 75.8},
      %{id: 17, angle: 24.709, x: -4.4, y: 74.6},
      %{id: 9, angle: -165.413, x: 30.8, y: 41.8},
      %{id: 32, angle: 40.892, x: 4.2, y: 78.6},
      %{id: 37, angle: 33.29, x: -15.8, y: 47.0},
      %{id: 6, angle: 51.295, x: 1.0, y: 80.6},
      %{id: 36, angle: 92.52, x: -27.0, y: 47.8},
      %{id: 14, angle: -52.001, x: -2.0, y: 34.4},
      %{id: 5, angle: 31.866, x: 23.2, y: 80.2},
      %{id: 27, angle: -75.303, x: -5.6, y: 32.8},
      %{id: 12, angle: 0.0, x: -1.0, y: 0.2},
      %{id: 3, angle: 46.72, x: -6.6, y: 3.2},
      %{id: 19, angle: -9.205, x: -13.8, y: 24.2}
    ]

    start = %{angle: -6.429, x: 0, y: 0}

    assert Prism.find_sequence(prisms, start) ==
             [
               7,
               30,
               16,
               28,
               13,
               22,
               23,
               10,
               9,
               24,
               25,
               38,
               29,
               4,
               35,
               21,
               5,
               20,
               11,
               1,
               33,
               26,
               32,
               6,
               15,
               17,
               2,
               14,
               27,
               34,
               37,
               31,
               36,
               18,
               19,
               8,
               3,
               12
             ]
  end

  @tag :pending
  test "complex path with multiple prisms floating point precision" do
    prisms = [
      %{id: 46, angle: -88.332, x: 37.4, y: 20.6},
      %{id: 72, angle: -90.774, x: -24.2, y: 23.4},
      %{id: 25, angle: 98.562, x: 78.6, y: 7.8},
      %{id: 60, angle: 115.56, x: -58.8, y: 31.6},
      %{id: 22, angle: 63.515, x: 75.2, y: 28.0},
      %{id: 2, angle: 91.176, x: 89.8, y: 27.8},
      %{id: 23, angle: 30.829, x: 9.8, y: 30.8},
      %{id: 69, angle: -88.315, x: 22.8, y: 20.6},
      %{id: 44, angle: -116.565, x: -0.8, y: 15.6},
      %{id: 36, angle: -90.0, x: -24.2, y: 8.2},
      %{id: 53, angle: 0.0, x: -1.2, y: 0.0},
      %{id: 52, angle: -143.896, x: 14.2, y: 24.0},
      %{id: 5, angle: 93.128, x: -65.2, y: 21.6},
      %{id: 66, angle: 31.608, x: 5.4, y: 15.6},
      %{id: 51, angle: -100.976, x: -72.6, y: 21.0},
      %{id: 65, angle: 87.455, x: 48.0, y: 10.2},
      %{id: 21, angle: 68.352, x: -41.8, y: 0.0},
      %{id: 18, angle: -128.362, x: -46.2, y: 19.2},
      %{id: 10, angle: 90.939, x: 74.4, y: 0.4},
      %{id: 15, angle: 84.958, x: 67.6, y: 0.4},
      %{id: 35, angle: 89.176, x: 14.8, y: -0.4},
      %{id: 1, angle: 89.105, x: 83.0, y: 0.2},
      %{id: 68, angle: -29.867, x: 14.6, y: 28.0},
      %{id: 67, angle: -136.643, x: 79.8, y: 18.6},
      %{id: 38, angle: -90.848, x: 53.0, y: 14.6},
      %{id: 31, angle: -61.837, x: -58.0, y: 6.6},
      %{id: 74, angle: 85.966, x: -30.8, y: 0.4},
      %{id: 48, angle: -161.222, x: -4.6, y: 10.0},
      %{id: 12, angle: -91.164, x: 59.0, y: 5.0},
      %{id: 33, angle: 90.734, x: -16.4, y: 18.4},
      %{id: 4, angle: 71.127, x: 82.6, y: 27.6},
      %{id: 75, angle: -1.108, x: -10.2, y: 30.6},
      %{id: 28, angle: 86.863, x: 38.0, y: 0.0},
      %{id: 11, angle: 92.353, x: 64.4, y: -0.2},
      %{id: 9, angle: 67.249, x: -51.4, y: 31.6},
      %{id: 26, angle: 61.113, x: -39.8, y: 30.8},
      %{id: 30, angle: 111.33, x: -34.2, y: 0.6},
      %{id: 56, angle: 70.445, x: -51.0, y: 0.2},
      %{id: 41, angle: 91.219, x: -12.0, y: 0.0},
      %{id: 24, angle: 86.586, x: 63.8, y: 14.4},
      %{id: 70, angle: -87.238, x: -72.8, y: 13.4},
      %{id: 3, angle: -91.685, x: 22.4, y: 7.0},
      %{id: 13, angle: 90.0, x: 34.4, y: 7.0},
      %{id: 16, angle: -136.02, x: -47.4, y: 11.4},
      %{id: 6, angle: 90.415, x: 90.0, y: 0.2},
      %{id: 54, angle: 85.969, x: 44.0, y: 27.8},
      %{id: 32, angle: 91.615, x: -9.0, y: 0.0},
      %{id: 8, angle: 0.535, x: -31.6, y: 30.8},
      %{id: 39, angle: 90.0, x: -12.0, y: 8.2},
      %{id: 14, angle: 92.342, x: -79.6, y: 32.4},
      %{id: 42, angle: -85.867, x: 65.8, y: 20.8},
      %{id: 40, angle: 87.109, x: -65.0, y: 14.0},
      %{id: 45, angle: 23.697, x: 10.6, y: 18.8},
      %{id: 71, angle: -88.531, x: -24.2, y: 18.6},
      %{id: 7, angle: -89.148, x: -72.6, y: 6.4},
      %{id: 62, angle: -140.8, x: -32.0, y: 24.8},
      %{id: 49, angle: 89.415, x: 34.4, y: -0.2},
      %{id: 63, angle: -138.429, x: 74.2, y: 12.6},
      %{id: 59, angle: -140.177, x: 82.8, y: 13.0},
      %{id: 34, angle: -88.238, x: -9.4, y: 23.2},
      %{id: 76, angle: 1.2, x: -57.6, y: 0.0},
      %{id: 43, angle: 116.565, x: 7.0, y: 0.0},
      %{id: 20, angle: 1.469, x: 45.8, y: -0.2},
      %{id: 37, angle: 84.785, x: -16.6, y: 13.2},
      %{id: 58, angle: 89.481, x: -79.0, y: -0.2},
      %{id: 50, angle: -86.987, x: -24.2, y: 12.8},
      %{id: 64, angle: -92.203, x: 59.2, y: 10.2},
      %{id: 61, angle: -83.66, x: -72.0, y: 26.4},
      %{id: 47, angle: -82.992, x: 45.4, y: 5.8},
      %{id: 17, angle: -52.938, x: -52.2, y: 17.8},
      %{id: 57, angle: 84.627, x: -61.8, y: 32.0},
      %{id: 29, angle: 92.954, x: 47.2, y: 28.2},
      %{id: 27, angle: 87.397, x: -4.6, y: 0.2},
      %{id: 55, angle: 94.086, x: -61.4, y: 26.4},
      %{id: 73, angle: -62.229, x: -40.4, y: 13.4},
      %{id: 19, angle: -87.181, x: 53.2, y: 20.6}
    ]

    start = %{angle: 0.0, x: 0, y: 0}

    assert Prism.find_sequence(prisms, start) ==
             [
               43,
               44,
               66,
               45,
               52,
               35,
               49,
               13,
               3,
               69,
               46,
               28,
               20,
               11,
               24,
               38,
               19,
               42,
               15,
               10,
               63,
               25,
               59,
               1,
               6,
               2,
               4,
               67,
               22,
               29,
               65,
               64,
               12,
               47,
               54,
               68,
               23,
               75,
               8,
               26,
               18,
               9,
               60,
               17,
               31,
               7,
               70,
               40,
               5,
               51,
               61,
               55,
               57,
               14,
               58,
               76,
               56,
               16,
               21,
               30,
               73,
               62,
               74,
               41,
               39,
               36,
               50,
               37,
               33,
               71,
               72,
               34,
               32,
               27,
               48,
               53
             ]
  end
end
