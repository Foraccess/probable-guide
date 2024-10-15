from flask import Flask, render_template, request

app = Flask(__name__)

# Карта символов для замены
replacement_map = {
    'а': 'а', 'б': 'б', 'в': 'В', 'г': 'г', 'д': 'ԁ',
    'е': 'е', 'ё': 'ё', 'ж': 'ӂ', 'з': '3', 'и': 'u',
    'й': 'ј', 'к': 'қ', 'л': 'ӏ', 'м': 'м', 'н': 'п',
    'о': 'о', 'п': 'п', 'р': 'р', 'с': 'с', 'т': 'т',
    'у': 'у', 'ф': 'ӻ', 'х': 'х', 'ц': 'ҫ', 'ч': 'ч',
    'ш': 'ш', 'щ': 'щ', 'ъ': 'ъ', 'ы': 'ы', 'ь': 'ь',
    'э': 'э', 'ю': 'ю', 'я': 'я'
}

def replace_characters(word):
    return ''.join(replacement_map.get(char, char) for char in word)

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        input_word = request.form['input_word']
        transformed_word = replace_characters(input_word)
        return render_template('index.html', input_word=input_word, transformed_word=transformed_word)
    return render_template('index.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
