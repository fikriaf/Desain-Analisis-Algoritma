# Mencari luas jajargenjang
def luas_jajargenjang(p, t):
    luas = p * t
    return luas


panjang = 25
tinggi = 30
print(
    f"Diketahui sebuah jajar genjang memiliki ukuran\npanjang = {panjang}\ntinggi = {tinggi}"
)

hasil = luas_jajargenjang(panjang, tinggi)
print("\nLuas Jajar Genjang = panjang x tinggi =", hasil)
