# getSum adalah perintah untuk mendapatkan hasil jumlah seluruh angka.
# Bagaimana jika kita membutuhkan fungsi getBagi untuk membagikan seluruh angka?


def getBagi(mylist):
    bagi = mylist[0]
    for item in mylist[1:]:
        bagi /= item
    return bagi


print(getBagi([8, 2, 1]))
