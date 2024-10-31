from flask import Flask, jsonify
from data_fetcher import fetch_data
from data_processor import process_data

app = Flask(__name__)

@app.route('/stats', methods=['GET'])
def get_stats():
    data = fetch_data()
    stats = process_data(data)
    return jsonify(stats)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)