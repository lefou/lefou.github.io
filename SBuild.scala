import de.tototec.sbuild._

@version("0.7.2")
@classpath("mvn:org.sbuild:org.sbuild.plugins.jbake:0.1.2")
// @classpath("/home/lefou/work/tototec/sbuild/jbake/org.sbuild.plugins.jbake/target/org.sbuild.plugins.jbake-0.1.2.9000.jar")
class SBuild(implicit _project: Project) {

  val repo = "https://github.com/lefou/lefou.github.io.git"
  val branch = "master"
  Target("phony:clean").evictCache exec {
    Path("target").deleteRecursive
  }

  import org.sbuild.plugins.jbake._
  Plugin[JBake] configure { _.copy(
    sourceDir = Path("src"),
    targetDir = Path("target"),
    jbakeVersion = JBakeVersion.Packaged("2.3.2", s"http://dl.bintray.com/jbake/binary/jbake-2.3.2-bin.zip")
   ) }

  Target("phony:prepare-target") exec {
    val dir = Path("target")
    dir.mkdirs()
    import sys.process._
    val exitVal = Process(
      Seq("git", "clone", "--depth", "1", "--single-branch", "--branch", branch, repo, dir.getPath),
      cwd = dir
      ) #&&
      Process(Seq("git", "rm", "-rf", "."), cwd = dir) !;
    if (exitVal != 0) throw new RuntimeException("Exit code: " + exitVal)
  }

  Target("phony:stage-site-to-git") dependsOn "clean" ~~ "prepare-target" ~~ "jbake" exec {
    val dir = Path("target")
    import sys.process._
    val code = Process(Seq("git", "add", "*"), cwd = dir) !;
    if(code != 0) throw new RuntimeException("Exit code: " + code)
  }

  Target("phony:build-and-commit-site") dependsOn "stage-site-to-git" exec {
    val dir = Path("target")
    import sys.process._
    val code = Process(Seq("git", "commit"), cwd = dir) !<;
    if(code != 0) throw new RuntimeException("Exit code: " + code)
  }

}
