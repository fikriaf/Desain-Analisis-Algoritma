# Buatlah suatu fungsi untuk : mengurangi 2 himpunan angka, jika getSum untuk menjumlahkan angka!
def getKurangiHimpunan(list1, list2):
    hasil_kurangi = []
    for a, b in zip(list1, list2):
        hasil_kurangi.append(a - b)
    return hasil_kurangi


list1 = [4, 12, 6]
list2 = [2, 3, 2]
print(getKurangiHimpunan(list1, list2))
