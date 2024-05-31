defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    datetime
    |> NaiveDateTime.to_time()
    |> Time.before?(Time.new!(12, 0, 0))
  end

  def return_date(checkout_datetime) do
    days = if(before_noon?(checkout_datetime), do: 28, else: 29)

    checkout_datetime
    |> NaiveDateTime.add(days, :day)
    |> NaiveDateTime.to_date()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    case Date.diff(actual_return_datetime, planned_return_date) do
      d when d >= 1 -> d
      _ -> 0
    end
  end

  def monday?(datetime) do
    1 ==
      datetime
      |> NaiveDateTime.to_date()
      |> Date.day_of_week()
  end

  def calculate_late_fee(checkout, return, rate) do
    return = datetime_from_string(return)
    expected_return = return_date(datetime_from_string(checkout))
    fees = days_late(expected_return, return) * rate

    if monday?(return) do
      floor(fees * 0.5)
    else
      fees
    end
  end
end
