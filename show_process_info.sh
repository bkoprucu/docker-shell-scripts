#!/bin/bash

ps -Ao user,pid,command | grep -v grep | grep $1
