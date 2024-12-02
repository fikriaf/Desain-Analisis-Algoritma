# Mencari luas segitiga
def luas_segitiga(a, t):
    luas = 1 / 2 * a * t
    return luas


alas = 25
tinggi = 30
print(f"Diketahui sebuah segitiga memiliki ukuran\nalas = {alas}\ntinggi = {tinggi}")

hasil = luas_segitiga(alas, tinggi)
print("\nLuas Segitiga = 1/2 x alas x tinggi =", hasil)
