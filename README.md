ctest --output-on-failure

cpack -G ZIP
cpack -G DEB
cpack -G RPM

cpack -G ZIP
cpack -G NSIS
cpack -G DEB

gh release create v1.0.0 ./build/MyProject-1.0.0.zip