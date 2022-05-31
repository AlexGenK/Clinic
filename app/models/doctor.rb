class Doctor < User
  has_many :appointments, class_name: 'Appointment', foreign_key: :doctor_id
  has_many :patients, through: 'appointments', foreign_key: :patient_id  
end