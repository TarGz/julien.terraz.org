#!/bin/bash

# Start Jekyll server with drafts enabled and custom ports to avoid conflicts with other Jekyll instances
bundle exec jekyll serve --port 4002 --livereload --livereload-port 35730 --drafts