

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    project.layout.buildDirectory.value(newBuildDir.dir(project.name))
}
subprojects {
    project.evaluationDependsOn(":app")
    dependencyLocking {
        ignoredDependencies.add("io.flutter:*")
        lockFile = file("${rootProject.projectDir}/${project.name}.lockfile")
        if (!project.hasProperty("local-engine-repo")) {
          lockAllConfigurations()
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
