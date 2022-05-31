class Patient < User
	has_many :appointments, class_name: 'Appointment', foreign_key: :patient_id
	has_many :doctors, through: 'appointments', foreign_key: :doctor_id  
end
