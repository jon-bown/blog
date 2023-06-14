---
layout: post
title: "🎶 Create a Spotify Artist Dataset with Python 🐍"
description: ""
date: 2023-06-13
categories: python
---

Maintaining good datasets anywhere, particularly ones that change over time, is challenging. Manually updating files and posting them to your favorite platform takes a lot of time. Lets make things a bit easier.

I recently build a dataset on [Kaggle](https://www.kaggle.com/datasets/jonbown/metallica-songs) of all Metallica albums/songs. I spent some time going through the Kaggle API documentation and understanding the best way to automate the update workflow. I also needed to use the Spotify API to get the music data. I want to share what I learned for others working on similar projects.

These instructions are specific to creating a datset of a single artist using the Spotify API. 


> 1. Log in or create spotify developer account
2. Create a new application, keys are created on the application level not the user account level.
3. Go to 'Settings' then 'Basic Information'
4. Extract your Client ID and Client Secret
5. If developing locally, place credentials in config.py, Add config.py to .gitignore to avoid committing to any repo
6. If developing via colab or Kaggle notebook, add credentials as secrets.
7. Pip install spotipy python package

```bash
pip install spotipy
```

## Necessary Imports

The following snippet contains the necessary import statements to use spotipy

```python
import numpy as np
import pandas as pd
import spotipy
from spotipy.oauth2 import SpotifyClientCredentials
#If developing locally
import config
```

## Authenticate Spotipy object

```python
#Extract credentials from config.py
client_credentials_manager = SpotifyClientCredentials(client_id=config.spotify_credentials['CLIENT_ID'], client_secret=config.spotify_credentials['CLIENT_SECRET'])
sp = spotipy.Spotify(client_credentials_manager = client_credentials_manager)
```

## Initialize empty list 

This list will hold each row until we are ready to set it as a dataframe.

```python
#initialize dataframes
artist_data = []
```

## Locate the spotify artist URI

This is as easy as going to the spotify website, looking up the right artist profile, and extracting the last bit of the URL from your browser.

```python
#Get UNIQUE ALBUMS
artist_uri = 'spotify:artist:URI HERE'
```

## Get Artist's Albums

Unfortunately there isn't a command to just 'get all songs' for a certain artist. You must go through albums first.

```python
results = sp.artist_albums(artist_uri, album_type='album')
albums = results['items']
while results['next']:
    results = sp.next(results)
    albums.extend(results['items'])

names = []
album_ids = []
for album in albums:
    name = album['name'].lower()
    if name not in names:
        names.append(name)
        album_ids.append(album['id'])
```

## Construct Song Features

This code extracts the song features and builds key/value pairs to then represent a row in the resulting pandas dataframe.

```python
#Construct track specific data
for album_id in album_ids:
    results = sp.album_tracks(album_id)
    album_info = sp.album(album_id)
    tracks = results['items']
    #Results from spotify API come back in pages
    while results['next']:
        results = sp.next(results)
        tracks.extend(results['items'])

    for track in tracks:
        track_row = {}
        track_row['spotify_id'] = track['id']
        track_row['spotify_uri'] = track['uri']
        track_row['album'] = album_info['name']
        track_row['name'] = track['name']
        track_row['release_date'] = album_info['release_date']
        track_row['track_number'] = track['track_number']
        popularity = sp.track(track['id'])['popularity']
        track_row['popularity'] = popularity
        features = sp.audio_features(track['id'])[0]
        track_row['danceability'] = features['danceability']
        track_row['energy'] = features['energy']
        track_row['key'] = features['key']
        track_row['loudness'] = features['loudness']
        track_row['mode'] = features['mode']
        track_row['speechiness'] = features['speechiness']
        track_row['acousticness'] = features['acousticness']
        track_row['instrumentalness'] = features['instrumentalness']
        track_row['liveness'] = features['liveness']
        track_row['valence'] = features['valence']
        track_row['tempo'] = features['tempo']
        track_row['duration_ms'] = features['duration_ms']
        track_row['time_signature'] = features['time_signature']
        artist_data.append(track_row)
```

*Notice there isn't much error handling here, this is because I want to focus on the overall functionality and not the edge cases. But its very possible you'll encounter various issues specific to whatever artist you're working with when unpacking the API results.*

## Finalize Dataframe

Take the list of rows and create pandas dataframe

```python
cols = ['spotify_id', 'spotify_uri', 'album', 'name', 'popularity', 'release_date', 'track_number', 'danceability',        'energy','key', 'loudness', 'mode', 'speechiness', 'acousticness', 'instrumentalness', 'liveness', 'valence', 
'tempo', 'duration_ms', 'time_signature']
artist_dataframe = pd.DataFrame(artist_data, columns = cols)   
```

From here you can output to a csv, send it to the Kaggle API, or just download and upload as a dataset to Kaggle. If you want to learn more, I have a few repositories that will come in handy. 

# Learn More

- [Metallica Repo](https://github.com/jon-bown/metallica) - This repository uses GitHub actions and GitHub secrets to maintain the Metallica Songs dataset on Kaggle.

- [Metallica Songs](https://www.kaggle.com/datasets/jonbown/metallica-songs) - Actively maintained dataset on Kaggle through the API.

- [Template Repo](https://github.com/jon-bown/kaggle-data-pipeline) - This repository has a template you can work off of to build your own spotify artist dataset.

- [Spotify API Docs](https://developer.spotify.com/documentation/web-api)

- [Spotipy](https://spotipy.readthedocs.io/en/2.22.1/)