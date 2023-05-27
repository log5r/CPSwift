#!/usr/bin/env sh

for file in $(ls ./Sources/CPSwift/Extensions/)
do
  cat "./Sources/CPSwift/Extensions/$file" >> snippets.swift
done
