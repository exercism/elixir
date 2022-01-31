defmodule SpaceAge do
  def age_on(:earth, seconds), do: {:ok, seconds / 31_557_600.0}

  def age_on(planet, seconds) do
    with {:ok, rel} <- planet_rel_years(planet),
         {:ok, earth} <- age_on(:earth, seconds) do
      {:ok, earth / rel}
    end
  end

  defp planet_rel_years(:mercury), do: {:ok, 0.2408467}
  defp planet_rel_years(:venus), do: {:ok, 0.61519726}
  defp planet_rel_years(:mars), do: {:ok, 1.8808158}
  defp planet_rel_years(:jupiter), do: {:ok, 11.862615}
  defp planet_rel_years(:saturn), do: {:ok, 29.447498}
  defp planet_rel_years(:uranus), do: {:ok, 84.016846}
  defp planet_rel_years(:neptune), do: {:ok, 164.79132}
  defp planet_rel_years(_), do: {:error, "not a planet"}
end
