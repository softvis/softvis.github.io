#!/bin/bash

# Set this to activate minifier
#export JEKYLL_ENV="production"

# This builds site from scratch; doesn't update Jekyll
rm -R _site
bundle install --path .rubygems
bundle exec jekyll serve --watch --drafts
