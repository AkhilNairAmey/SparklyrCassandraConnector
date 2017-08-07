#' Cassandra Session
#'
#' Return a connection session
#'
#' @param sc Spark context used for the scala context
#' @param cluster The target cluster to which to connect
#' @param keyspace The keyspace to which to connect
#'
#' @export
cql_connect <- function(sc, cluster, keyspace) {
  sparklyr::invoke_static(sc, "CQLConnect.Connection", "cql_session", cluster, keyspace)
}
