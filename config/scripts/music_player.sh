#!/bin/sh
ffplay ~/Music/"$(ls ~/Music | dmenu -l 20)"
