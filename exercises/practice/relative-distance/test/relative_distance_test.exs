defmodule RelativeDistanceTest do
  use ExUnit.Case

  # @tag :pending
  test "Direct parent-child relation" do
    family_tree = %{"Vera" => ["Tomoko"], "Tomoko" => ["Aditi"]}
    person_a = "Vera"
    person_b = "Tomoko"
    assert RelativeDistance.degree_of_separation(family_tree, person_a, person_b) == 1
  end

  @tag :pending
  test "Sibling relationship" do
    family_tree = %{"Dalia" => ["Olga", "Yassin"]}
    person_a = "Olga"
    person_b = "Yassin"
    assert RelativeDistance.degree_of_separation(family_tree, person_a, person_b) == 1
  end

  @tag :pending
  test "Two degrees of separation, grandchild" do
    family_tree = %{"Khadija" => ["Mateo"], "Mateo" => ["Rami"]}
    person_a = "Khadija"
    person_b = "Rami"
    assert RelativeDistance.degree_of_separation(family_tree, person_a, person_b) == 2
  end

  @tag :pending
  test "Unrelated individuals" do
    family_tree = %{"Kaito" => ["Elif"], "Priya" => ["Rami"]}
    person_a = "Priya"
    person_b = "Kaito"
    assert RelativeDistance.degree_of_separation(family_tree, person_a, person_b) == nil
  end

  @tag :pending
  test "Complex graph, cousins" do
    family_tree = %{
      "Aiko" => ["Bao", "Carlos"],
      "Bao" => ["Dalia", "Elias"],
      "Carlos" => ["Fatima", "Gustavo"],
      "Dalia" => ["Hassan", "Isla"],
      "Elias" => ["Javier"],
      "Fatima" => ["Khadija", "Liam"],
      "Gustavo" => ["Mina"],
      "Hassan" => ["Noah", "Olga"],
      "Isla" => ["Pedro"],
      "Javier" => ["Quynh", "Ravi"],
      "Khadija" => ["Sofia"],
      "Liam" => ["Tariq", "Uma"],
      "Mina" => ["Viktor", "Wang"],
      "Noah" => ["Xiomara"],
      "Olga" => ["Yuki"],
      "Pedro" => ["Zane", "Aditi"],
      "Quynh" => ["Boris"],
      "Ravi" => ["Celine"],
      "Sofia" => ["Diego", "Elif"],
      "Tariq" => ["Farah"],
      "Uma" => ["Giorgio"],
      "Viktor" => ["Hana", "Ian"],
      "Wang" => ["Jing"],
      "Xiomara" => ["Kaito"],
      "Yuki" => ["Leila"],
      "Zane" => ["Mateo"],
      "Aditi" => ["Nia"],
      "Boris" => ["Oscar"],
      "Celine" => ["Priya"],
      "Diego" => ["Qi"],
      "Elif" => ["Rami"],
      "Farah" => ["Sven"],
      "Giorgio" => ["Tomoko"],
      "Hana" => ["Umar"],
      "Ian" => ["Vera"],
      "Jing" => ["Wyatt"],
      "Kaito" => ["Xia"],
      "Leila" => ["Yassin"],
      "Mateo" => ["Zara"],
      "Nia" => ["Antonio"],
      "Oscar" => ["Bianca"],
      "Priya" => ["Cai"],
      "Qi" => ["Dimitri"],
      "Rami" => ["Ewa"],
      "Sven" => ["Fabio"],
      "Tomoko" => ["Gabriela"],
      "Umar" => ["Helena"],
      "Vera" => ["Igor"],
      "Wyatt" => ["Jun"],
      "Xia" => ["Kim"],
      "Yassin" => ["Lucia"],
      "Zara" => ["Mohammed"]
    }

    person_a = "Dimitri"
    person_b = "Fabio"
    assert RelativeDistance.degree_of_separation(family_tree, person_a, person_b) == 9
  end

  @tag :pending
  test "Complex graph, no shortcut, far removed nephew" do
    family_tree = %{
      "Aiko" => ["Bao", "Carlos"],
      "Bao" => ["Dalia", "Elias"],
      "Carlos" => ["Fatima", "Gustavo"],
      "Dalia" => ["Hassan", "Isla"],
      "Elias" => ["Javier"],
      "Fatima" => ["Khadija", "Liam"],
      "Gustavo" => ["Mina"],
      "Hassan" => ["Noah", "Olga"],
      "Isla" => ["Pedro"],
      "Javier" => ["Quynh", "Ravi"],
      "Khadija" => ["Sofia"],
      "Liam" => ["Tariq", "Uma"],
      "Mina" => ["Viktor", "Wang"],
      "Noah" => ["Xiomara"],
      "Olga" => ["Yuki"],
      "Pedro" => ["Zane", "Aditi"],
      "Quynh" => ["Boris"],
      "Ravi" => ["Celine"],
      "Sofia" => ["Diego", "Elif"],
      "Tariq" => ["Farah"],
      "Uma" => ["Giorgio"],
      "Viktor" => ["Hana", "Ian"],
      "Wang" => ["Jing"],
      "Xiomara" => ["Kaito"],
      "Yuki" => ["Leila"],
      "Zane" => ["Mateo"],
      "Aditi" => ["Nia"],
      "Boris" => ["Oscar"],
      "Celine" => ["Priya"],
      "Diego" => ["Qi"],
      "Elif" => ["Rami"],
      "Farah" => ["Sven"],
      "Giorgio" => ["Tomoko"],
      "Hana" => ["Umar"],
      "Ian" => ["Vera"],
      "Jing" => ["Wyatt"],
      "Kaito" => ["Xia"],
      "Leila" => ["Yassin"],
      "Mateo" => ["Zara"],
      "Nia" => ["Antonio"],
      "Oscar" => ["Bianca"],
      "Priya" => ["Cai"],
      "Qi" => ["Dimitri"],
      "Rami" => ["Ewa"],
      "Sven" => ["Fabio"],
      "Tomoko" => ["Gabriela"],
      "Umar" => ["Helena"],
      "Vera" => ["Igor"],
      "Wyatt" => ["Jun"],
      "Xia" => ["Kim"],
      "Yassin" => ["Lucia"],
      "Zara" => ["Mohammed"]
    }

    person_a = "Lucia"
    person_b = "Jun"
    assert RelativeDistance.degree_of_separation(family_tree, person_a, person_b) == 14
  end

  @tag :pending
  test "Complex graph, some shortcuts, cross-down and cross-up, cousins several times removed, with unrelated family tree" do
    family_tree = %{
      "Aiko" => ["Bao", "Carlos"],
      "Bao" => ["Dalia"],
      "Carlos" => ["Fatima", "Gustavo"],
      "Dalia" => ["Hassan", "Isla"],
      "Fatima" => ["Khadija", "Liam"],
      "Gustavo" => ["Mina"],
      "Hassan" => ["Noah", "Olga"],
      "Isla" => ["Pedro"],
      "Javier" => ["Quynh", "Ravi"],
      "Khadija" => ["Sofia"],
      "Liam" => ["Tariq", "Uma"],
      "Mina" => ["Viktor", "Wang"],
      "Noah" => ["Xiomara"],
      "Olga" => ["Yuki"],
      "Pedro" => ["Zane", "Aditi"],
      "Quynh" => ["Boris"],
      "Ravi" => ["Celine"],
      "Sofia" => ["Diego", "Elif"],
      "Tariq" => ["Farah"],
      "Uma" => ["Giorgio"],
      "Viktor" => ["Hana", "Ian"],
      "Wang" => ["Jing"],
      "Xiomara" => ["Kaito"],
      "Yuki" => ["Leila"],
      "Zane" => ["Mateo"],
      "Aditi" => ["Nia"],
      "Boris" => ["Oscar"],
      "Celine" => ["Priya"],
      "Diego" => ["Qi"],
      "Elif" => ["Rami"],
      "Farah" => ["Sven"],
      "Giorgio" => ["Tomoko"],
      "Hana" => ["Umar"],
      "Ian" => ["Vera"],
      "Jing" => ["Wyatt"],
      "Kaito" => ["Xia"],
      "Leila" => ["Yassin"],
      "Mateo" => ["Zara"],
      "Nia" => ["Antonio"],
      "Oscar" => ["Bianca"],
      "Priya" => ["Cai"],
      "Qi" => ["Dimitri"],
      "Rami" => ["Ewa"],
      "Sven" => ["Fabio"],
      "Tomoko" => ["Gabriela"],
      "Umar" => ["Helena"],
      "Vera" => ["Igor"],
      "Wyatt" => ["Jun"],
      "Xia" => ["Kim"],
      "Yassin" => ["Lucia"],
      "Zara" => ["Mohammed"]
    }

    person_a = "Wyatt"
    person_b = "Xia"
    assert RelativeDistance.degree_of_separation(family_tree, person_a, person_b) == 12
  end
end
