#!/usr/bin/env ruby

this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'lib')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'schedule/schedule_services_pb'

# GreeterServer is simple server that implements the Schedule ScheduleService server.
class GreeterServer < Schedule::ScheduleService::Service
    # say_hello implements the SayHello rpc method.
    def list_schedule(hello_req, _unused_call)
        Schedule::Schedule.new(message: "Hello #{hello_req.name}")
    end
end

# main starts an RpcServer that receives requests to GreeterServer at the sample
# server port.
def main
    s = GRPC::RpcServer.new
    s.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
    s.handle(GreeterServer)
    # Runs the server with SIGHUP, SIGINT and SIGQUIT signal handlers to 
    #   gracefully shutdown.
    # User could also choose to run server via call to run_till_terminated
    s.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])
end

main