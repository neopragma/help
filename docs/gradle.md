# Notes on Gradle

[Contents](contents.md) | [KWIC Index](kwic-index.md)

* [recompile with xlint](#recompile-with-xlint)
* [update_gradle_from_command_line](#update-gradle-from-command-line)

## Recompile with Xlint 

When working with Java and Gradle, sometimes Gradle issues a warning and suggests recompiling with an -Xlint option, but it does not explain how to do this. You have to add a specification to the build.gradle file as follows.

```shell
tasks.withType(JavaCompile) {
    options.compilerArgs << '-Xlint:unchecked'
    options.deprecation = true
}
```

## Update Gradle from command line 

```shell
./gradlew wrapper --gradle-version 4.10.2
```
