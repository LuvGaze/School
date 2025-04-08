string = "hello world"
char_count = {}
for char in string:
    if char in char_count:
        char_count[char] += 1
    else:
        char_count[char] = 1

sorted_count = sorted(char_count.items(), key=lambda x:x[1], reverse=True)
sorted_chars = [item[0] for item in sorted_count]
print(char_count,sorted_count,sorted_chars)