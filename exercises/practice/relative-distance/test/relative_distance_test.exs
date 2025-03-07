defmodule RelativeDistanceTest do
  use ExUnit.Case

  # TODO: preserve the ordering of the original specs

  # @tag :pending
  test "Direct parent-child relation" do
    family_tree = %{"Tomoko" => ["Aditi"], "Vera" => ["Tomoko"]}
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
      "Kaito" => ["Xia"],
      "Celine" => ["Priya"],
      "Xiomara" => ["Kaito"],
      "Priya" => ["Cai"],
      "Noah" => ["Xiomara"],
      "Mina" => ["Viktor", "Wang"],
      "Dalia" => ["Hassan", "Isla"],
      "Wyatt" => ["Jun"],
      "Yassin" => ["Lucia"],
      "Xia" => ["Kim"],
      "Fatima" => ["Khadija", "Liam"],
      "Javier" => ["Quynh", "Ravi"],
      "Sven" => ["Fabio"],
      "Khadija" => ["Sofia"],
      "Quynh" => ["Boris"],
      "Isla" => ["Pedro"],
      "Oscar" => ["Bianca"],
      "Gustavo" => ["Mina"],
      "Carlos" => ["Fatima", "Gustavo"],
      "Elias" => ["Javier"],
      "Bao" => ["Dalia", "Elias"],
      "Qi" => ["Dimitri"],
      "Rami" => ["Ewa"],
      "Olga" => ["Yuki"],
      "Nia" => ["Antonio"],
      "Vera" => ["Igor"],
      "Giorgio" => ["Tomoko"],
      "Mateo" => ["Zara"],
      "Leila" => ["Yassin"],
      "Ravi" => ["Celine"],
      "Aditi" => ["Nia"],
      "Hassan" => ["Noah", "Olga"],
      "Boris" => ["Oscar"],
      "Sofia" => ["Diego", "Elif"],
      "Zane" => ["Mateo"],
      "Zara" => ["Mohammed"],
      "Hana" => ["Umar"],
      "Uma" => ["Giorgio"],
      "Aiko" => ["Bao", "Carlos"],
      "Jing" => ["Wyatt"],
      "Farah" => ["Sven"],
      "Liam" => ["Tariq", "Uma"],
      "Elif" => ["Rami"],
      "Diego" => ["Qi"],
      "Tomoko" => ["Gabriela"],
      "Wang" => ["Jing"],
      "Pedro" => ["Zane", "Aditi"],
      "Viktor" => ["Hana", "Ian"],
      "Yuki" => ["Leila"],
      "Umar" => ["Helena"],
      "Tariq" => ["Farah"],
      "Ian" => ["Vera"]
    }

    person_a = "Dimitri"
    person_b = "Fabio"
    assert RelativeDistance.degree_of_separation(family_tree, person_a, person_b) == 4
  end

  @tag :pending
  test "Complex graph, no shortcut, far removed nephew" do
    family_tree = %{
      "Kaito" => ["Xia"],
      "Celine" => ["Priya"],
      "Xiomara" => ["Kaito"],
      "Priya" => ["Cai"],
      "Noah" => ["Xiomara"],
      "Mina" => ["Viktor", "Wang"],
      "Dalia" => ["Hassan", "Isla"],
      "Wyatt" => ["Jun"],
      "Yassin" => ["Lucia"],
      "Xia" => ["Kim"],
      "Fatima" => ["Khadija", "Liam"],
      "Javier" => ["Quynh", "Ravi"],
      "Sven" => ["Fabio"],
      "Khadija" => ["Sofia"],
      "Quynh" => ["Boris"],
      "Isla" => ["Pedro"],
      "Oscar" => ["Bianca"],
      "Gustavo" => ["Mina"],
      "Carlos" => ["Fatima", "Gustavo"],
      "Elias" => ["Javier"],
      "Bao" => ["Dalia", "Elias"],
      "Qi" => ["Dimitri"],
      "Rami" => ["Ewa"],
      "Olga" => ["Yuki"],
      "Nia" => ["Antonio"],
      "Vera" => ["Igor"],
      "Giorgio" => ["Tomoko"],
      "Mateo" => ["Zara"],
      "Leila" => ["Yassin"],
      "Ravi" => ["Celine"],
      "Aditi" => ["Nia"],
      "Hassan" => ["Noah", "Olga"],
      "Boris" => ["Oscar"],
      "Sofia" => ["Diego", "Elif"],
      "Zane" => ["Mateo"],
      "Zara" => ["Mohammed"],
      "Hana" => ["Umar"],
      "Uma" => ["Giorgio"],
      "Aiko" => ["Bao", "Carlos"],
      "Jing" => ["Wyatt"],
      "Farah" => ["Sven"],
      "Liam" => ["Tariq", "Uma"],
      "Elif" => ["Rami"],
      "Diego" => ["Qi"],
      "Tomoko" => ["Gabriela"],
      "Wang" => ["Jing"],
      "Pedro" => ["Zane", "Aditi"],
      "Viktor" => ["Hana", "Ian"],
      "Yuki" => ["Leila"],
      "Umar" => ["Helena"],
      "Tariq" => ["Farah"],
      "Ian" => ["Vera"]
    }

    person_a = "Lucia"
    person_b = "Jun"
    assert RelativeDistance.degree_of_separation(family_tree, person_a, person_b) == 15
  end

  @tag :pending
  test "Complex graph, some shortcuts, cross-down and cross-up, cousins three times removed" do
    family_tree = %{
      "Kaito" => ["Xia"],
      "Celine" => ["Priya"],
      "Xiomara" => ["Kaito"],
      "Priya" => ["Cai"],
      "Noah" => ["Xiomara"],
      "Mina" => ["Viktor", "Wang"],
      "Dalia" => ["Hassan", "Isla"],
      "Wyatt" => ["Jun"],
      "Yassin" => ["Lucia"],
      "Xia" => ["Kim"],
      "Fatima" => ["Khadija", "Liam"],
      "Javier" => ["Quynh", "Ravi"],
      "Sven" => ["Fabio"],
      "Khadija" => ["Viktor"],
      "Quynh" => ["Boris"],
      "Isla" => ["Pedro"],
      "Oscar" => ["Bianca"],
      "Gustavo" => ["Mina"],
      "Carlos" => ["Fatima", "Gustavo"],
      "Elias" => ["Javier"],
      "Bao" => ["Dalia", "Elias"],
      "Qi" => ["Dimitri"],
      "Rami" => ["Ewa"],
      "Olga" => ["Yuki"],
      "Nia" => ["Antonio"],
      "Vera" => ["Igor"],
      "Giorgio" => ["Tomoko"],
      "Mateo" => ["Zara"],
      "Leila" => ["Yassin"],
      "Ravi" => ["Celine"],
      "Aditi" => ["Nia"],
      "Hassan" => ["Noah", "Olga"],
      "Boris" => ["Oscar"],
      "Sofia" => ["Diego", "Elif"],
      "Zane" => ["Mateo"],
      "Zara" => ["Mohammed"],
      "Hana" => ["Umar"],
      "Uma" => ["Giorgio"],
      "Aiko" => ["Bao", "Carlos"],
      "Jing" => ["Wyatt"],
      "Farah" => ["Sven"],
      "Liam" => ["Tariq", "Uma"],
      "Elif" => ["Rami"],
      "Diego" => ["Qi"],
      "Tomoko" => ["Gabriela"],
      "Wang" => ["Jing"],
      "Pedro" => ["Zane", "Aditi"],
      "Viktor" => ["Hana", "Ian"],
      "Yuki" => ["Leila"],
      "Umar" => ["Helena"],
      "Tariq" => ["Farah"],
      "Ian" => ["Vera"]
    }

    person_a = "Tomoko"
    person_b = "Qi"
    assert RelativeDistance.degree_of_separation(family_tree, person_a, person_b) == 8
  end
end
