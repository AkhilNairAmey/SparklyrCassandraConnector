package CQLConnect

import java.util.Date

import com.weather.scalacass.ScalaSession


object Models {

  case class PollModel(
                        actual_loop_id:          Int,
                        time:                    Date,
                        vcc:                     Int,
                        channel:                 Int,
                        active_passive_reply:    Int,
                        actual_count_direction:  Int,
                        actual_velocity:         Int,
                        emergency_brakes_status: Int,
                        operating_mode:          Int,
                        position_number:         Int,
                        request_type1_response:  Int,
                        train_integrity:         Int,
                        vehicle_door_status:     Int
                      )

  def extract_poll_values(e: PollModel): Array[Any] = e.productIterator.map {
    case op: Option[_] => op.getOrElse(null)
    case v             => v
  }.toArray

}
