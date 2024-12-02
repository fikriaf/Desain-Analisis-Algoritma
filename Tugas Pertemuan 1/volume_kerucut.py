# Mencari valume kerucut
def volume_kerucut(d, t):
    volume = 1 / 3 * 3.14 * (d / 2) * (d / 2) * t
    return volume


diameter = 5
tinggi = 4
print(
    f"Diketahui sebuah kerucut memiliki ukuran\ndiameter = {diameter}\ntinggi = {tinggi}"
)

hasil = volume_kerucut(diameter, tinggi)
print("\nVolume Kecurut = 1/3 * π x (d/2)^2 x t =", hasil)
