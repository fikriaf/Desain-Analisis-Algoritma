# Mencari valume tabung
def volume_tabung(j, t):
    volume = 3.14 * j * j * t
    return volume


jari = 3
tinggi = 5
print(f"Diketahui sebuah tabung memiliki ukuran\njari-jari = {jari}\ntinggi = {tinggi}")

hasil = volume_tabung(jari, tinggi)
print("\nVolume Tabung = π x r^2 x t =", hasil)
