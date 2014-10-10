User.create!([
  {username: "mary_j",
  full_name: "Mary Jones",
  role: "therapist",
  email: "mary@test.com",
  encrypted_password:
  "$2a$10$xRikiHw1/3UduXV9Ghpq1uf9HE5W88Xm/12Z62Qt3Av5grI3xLUHC",
  reset_password_token: nil,
  reset_password_sent_at: nil,
  remember_created_at: nil,
  sign_in_count: 8,
  current_sign_in_at: "2014-10-10 17:13:40",
  last_sign_in_at: "2014-10-10 05:57:11",
  current_sign_in_ip: "127.0.0.1",
  last_sign_in_ip: "127.0.0.1"},

  {username: "jimbo",
  full_name: "jimbo jones",
  role: "client",
  email: "jimbo@test.com",
  encrypted_password:
  "$2a$10$PaOMj1ooOMWtfR3SMQkb/O4ZjlL2mopF9sQHLVJTr4enoZFnrcSi2",
  reset_password_token: nil,
  reset_password_sent_at: nil,
  remember_created_at: nil, sign_in_count: 7,
  current_sign_in_at: "2014-10-10 17:23:17",
  last_sign_in_at: "2014-10-10 17:13:11",
  current_sign_in_ip: "127.0.0.1",
  last_sign_in_ip: "127.0.0.1"}

])
Appointment.create!([
  {client_id: 2, therapist_id: 1,
    date: "2014-10-23",
    start_time: "2000-01-01 14:00:00",
    end_time: "2000-01-01 16:30:00", reserved: false,
    reservation_time: "2000-01-01 15:00:00", cancelled_id: 2},

  {client_id: 1, therapist_id: 1,
    date: "2014-10-27",
    start_time: "2000-01-01 10:00:00",
    end_time: "2000-01-01 18:00:00",
    reserved: false,
    reservation_time: "2000-01-01 16:00:00",
    cancelled_id: nil},

  {client_id: nil,
    therapist_id: 1,
    date: "2014-10-28",
    start_time: "2000-01-01 11:30:00",
    end_time: "2000-01-01 15:00:00",
    reserved: false,
    reservation_time: "2000-01-01 12:00:00",
    cancelled_id: 2}
])
