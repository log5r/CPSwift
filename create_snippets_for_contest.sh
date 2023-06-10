#!/usr/bin/env sh

rm snippets.swift
for file in $(ls ./Sources/CPSwift/Extensions/)
do
  cat "./Sources/CPSwift/Extensions/$file" >> snippets.swift
done

for file in $(ls ./Sources/CPSwift/Wrappers/)
do
  cat "./Sources/CPSwift/Extensions/$file" >> snippets.swift
done
