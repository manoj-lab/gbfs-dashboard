import requests

PROVIDERS = [
    "https://stables.donkey.bike/api/public/gbfs/2/donkey_utrechtse_heuvelrug/gbfs.json",
    "https://gbfs.goabout.com/2/gbfs.json",
    "https://stables.donkey.bike/api/public/gbfs/2/donkey_rt/gbfs.json"
]

def fetch_data():
    data = []
    for provider in PROVIDERS:
        response = requests.get(provider)
        if response.status_code == 200:
            data.append(response.json())
    return data
