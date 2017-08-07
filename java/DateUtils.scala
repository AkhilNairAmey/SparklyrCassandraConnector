package CQLConnect

import java.sql.Timestamp
import java.text.SimpleDateFormat
import java.util.Date


object DateUtils {

  val DateFormatter = new SimpleDateFormat("yyyy-MM-dd")

  def date_to_time(date: Date): Timestamp = {

    val time: Timestamp = new Timestamp(date.getTime())
    time

  }

}
