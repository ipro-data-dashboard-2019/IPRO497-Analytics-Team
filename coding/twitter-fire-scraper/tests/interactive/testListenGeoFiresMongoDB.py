"""
Demonstrates the ability to listen in a geographical area for a keyword tweet and save it to a MongoDB database.
"""
# noinspection PyUnresolvedReferences
import __init__

import tweepy

from twitter import TwitterAuthentication, MongoDBStreamListener, GEOBOX_CHICAGO
from util import geobox_from_points

if __name__ == "__main__":
    # Set up twitter auth.
    twauth = TwitterAuthentication()
    api = tweepy.API(twauth.oauth_handler)

    print("Listening for fires and logging to a MongoDB database.")
    mongolistener = MongoDBStreamListener()
    mongostream = tweepy.Stream(auth=api.auth, listener=mongolistener)

    mongostream.filter(locations=geobox_from_points(GEOBOX_CHICAGO))
