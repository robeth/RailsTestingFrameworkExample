#!/bin/sh

APPLITOOLS_WEBDRIVER=firefox rspec spec/features
APPLITOOLS_WEBDRIVER=android-chrome rspec spec/features