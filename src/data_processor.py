def process_data(data):
    stats = {"total_vehicles": 0, "provider_data": {}}
    for provider_data in data:
        vehicles = provider_data.get("data", {}).get("bikes", [])
        stats["total_vehicles"] += len(vehicles)
    return stats
