# Latihan Mandiri: Eksplorasi Mekanika Pergerakan
> Fitur yang dieksplorasi adalah double jump dan crouching
> 1. Double jump, diimplementasikan dengan menambah variabel boolean _can_double_jump_ pada Player.gd. Idenya adalah sesaat setelah melakukan lompatan kedua, nilai dari variabel ini akan _false_ sehingga player tidak dapat melompat lagi. Namun, nilai dari variabel ini akan kembali menjadi _true_. Nilai default dari variabel ini di set menjadi _true_ untuk memungkinkan player meloncat saat ia terjatuh tanpa melakukan lompatan.
> 2. Crouching, diimplentasikan dengan menambah variabel boolean _is_crouch_. Jika variabel ini bernilai _true_, maka player akan jongkok dan kecepatannya berkurang setengah. Dengan meloncat atau kembali menekan key "arrow_down" player akan kembali ke mode standing/idle.

_Referensi_: https://www.youtube.com/watch?v=sVJEaYNOUNw&t=1046s