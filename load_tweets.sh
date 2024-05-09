#!/bin/sh
    python3 load_tweets.py --db=postgresql://postgres:pass@localhost:1620 --user_rows=1000000
