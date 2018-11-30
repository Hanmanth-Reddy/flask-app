from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
   return 'Hi Hanmanth'

@app.route('/hello')
def hello():
   return 'Hi Hanmanth, welcome to flask framework world .. '

if __name__ == '__main__':
   app.run()
