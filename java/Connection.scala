package CQLConnect

import com.datastax.driver.core.Cluster
import com.weather.scalacass.ScalaSession

object Connection {

  def cql_session( cl:String, ks:String ) : ScalaSession = {
    val cluster = Cluster.builder.addContactPoint(cl).build()
    val session = cluster.connect()
    val sSession = ScalaSession(ks)(session)
    sSession
  }

}
