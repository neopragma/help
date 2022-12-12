# Notes for Linux and Unix 

[Contents](contents.md) | [KWIC Index](kwic-index.md)

* [diff](#diff)
    * [diff zipped files](#diff-zipped-files)
* [Replace string recursively ignore hidden files](#replace-string-recursively-ignore-hidden-files)


## diff

### diff zipped files

Compare the entry names of two zipped files without decompressing them. 

```shell
diff -y <(unzip -l foo.zip) <(unzip -l bar.zip) --suppress-common-lines
```

Reference: https://stackoverflow.com/questions/35581274/diff-files-inside-of-zip-without-extracting-it

## Replace string recursively ignore hidden files 

The -i argument to sed must have the name of the backup suffix for OSX. It's optional for Linux but must come after the -i with no intervening space.

```
find . \( ! -path '*/.*' \) -type f -exec sed -i~ "s/alpha/delta/g" '{}' ';'
```
