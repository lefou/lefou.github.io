import de.tototec.sbuild._

@version("0.7.2")
// @classpath("mvn:org.sbuild:org.sbuild.plugins.jbake:0.1.2")
@classpath("/home/lefou/work/tototec/sbuild/jbake/org.sbuild.plugins.jbake/target/org.sbuild.plugins.jbake-0.1.2.9000.jar")
class SBuild(implicit _project: Project) {

  Target("phony:clean").evictCache exec {
    Path("target").deleteRecursive
  }

  import org.sbuild.plugins.jbake._
  Plugin[JBake] configure { _.copy(
    sourceDir = Path("src"),
    targetDir = Path("target"),
    jbakeVersion = JBakeVersion.Packaged("2.3.2")
   ) }

}
