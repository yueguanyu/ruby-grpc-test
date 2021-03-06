# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: schedule/schedule.proto for package 'schedule'

require 'grpc'
require 'schedule/schedule_pb'

module Schedule
  module ScheduleService
    class Service

      include GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'schedule.ScheduleService'

      rpc :ListSchedule, ListScheduleRequest, Schedule
      rpc :CreateOneTimeGrpcSchedule, CreateGrpcScheduleRequest, Schedule
      rpc :CreateGrpcSchedule, CreateGrpcScheduleRequest, Schedule
      rpc :UpdateGrpcSchedule, UpdateGrpcScheduleRequest, Schedule
      rpc :CreateOneTimeBrokerSchedule, CreateBrokerScheduleRequest, Schedule
      rpc :CreateBrokerSchedule, CreateBrokerScheduleRequest, Schedule
      rpc :UpdateBrokerSchedule, UpdateBrokerScheduleRequest, Schedule
      rpc :CancelSchedule, Schedule, Schedule
    end

    Stub = Service.rpc_stub_class
  end
end
