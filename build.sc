import mill._
import $ivy.`de.tototec::de.tobiasroeser.mill.jbake:0.2.0`
import de.tobiasroeser.mill.jbake._

object site extends JBakeModule {

  def millSourcePath = super.millSourcePath / os.up

  def jbakeVersion = "2.6.4"

}
