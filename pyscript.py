import requests
import json

def send_to_discord(content):
    url = 'https://discordapp.com/api/webhooks/1328146311064584273/sft2dkzaIgbYVzx6Xm1WKJkRU4hHOoRz2rvHgQg9hmTN42BosnHtu85J0JXn1FG5r0DR'  
    data = {
        'content': content  
    }
    headers = {
        'Content-Type': 'application/json'  
    }
    
    
    response = requests.post(url, json=data, headers=headers)
    
    
    if response.status_code == 204:
        print("Message sent successfully!")
    else:
        print(f"Failed to send message: {response.status_code}")

send_to_discord("Nigga it worked!")
