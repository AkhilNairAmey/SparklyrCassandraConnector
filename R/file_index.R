#' File Index module
#'
#' Build a CQL query for a precompiled model
#' Pull the retuned objects back into R
#'
#' @rdname DistMvFileIndex
#'
#' @param sc Spark context used for the scala context
#' @param session The cassandra session
NULL

#' Dispatch the Distinct File Index query
#'
#' @export
cql_dist_file_index_query <- function(sc, session) {
  sparklyr::invoke_static(sc, "CQLConnect.FileIndex", "query_dist_file_index", session)
}

#' Extract file_index row
#'
#' @include utils.R
#' @export
cql_get_file_index_row <- function(sc, session) {
  sparklyr::invoke_static(sc, "CQLConnect.FileIndex", "get_dist_file_index_row", session)
}

#' Exhaust file_index row iterator to get whole file_index
#'
#' @include utils.R
#' @export
cql_iterate <- function(sc, iterator) {
  sparklyr::invoke_static(sc, "CQLConnect.FileIndex", "get_dist_file_index", iterator)
}

#' Exhaust file_index row iterator to get whole file_index
#'
#' @include utils.R
#' @export
cql_hasnext <- function(sc, iterator) {
  sparklyr::invoke_static(sc, "CQLConnect.FileIndex", "iterator_exhausted", iterator)
}

#' Exhaust file_index row iterator to get whole file_index
#'
#' @include utils.R
#' @export
cql_get_file_index <- function(sc, session) {
  iterator = cql_get_file_index_row(sc, session)
  lapply(1:2, function(i) sparklyr::invoke_static(sc, "CQLConnect.FileIndex", "get_dist_file_index", iterator))
}
