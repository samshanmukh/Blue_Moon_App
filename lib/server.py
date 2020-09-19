import stream_chat

client = stream_chat.StreamChat(api_key="4tz8t28at7we", api_secret="ufsxbrz693qauu38kxadwxd42m97kg9tvvsaavebs7ppxfvn6ztvseyrj53darr7")

client.update_users(
    [
        {"id": "Shanmukh", "name": "Sam Shanmukh", "role": "user", "image": "https://i.picsum.photos/id/319/150/150.jpg"},
        {"id": "shinchan", "name": "Shin Chan", "role": "user", "image": "https://i.picsum.photos/id/319/150/150.jpg"}
    ]
)

token = client.create_token('Shanmukh')
print(token)