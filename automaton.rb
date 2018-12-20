require_relative "helpers.rb"
require_relative "CpObjectsHandler/cpHost.rb"
require_relative "CpObjectsHandler/cpGroup.rb"
require_relative "CpObjectsHandler/cpNetwork.rb"
require_relative "CpObjectsHandler/cpRange.rb"
require_relative "CpObjectsHandler/cpObjectsHandler.rb"
require_relative "packageHandler.rb"
require_relative "../topographer/topographer.rb"
require_relative "config/localMappings.rb"
require_relative "config/tufinMappings.rb"
require "ipaddress"
require "awesome_print"

start_time = Time.now
# Do actual work
    system('cls')
    puts "< Worker >".rjust(26,"=").ljust(44,"=")
    # Load info
        puts
        puts "------>> Loading Files(~50s)"
        package_handler = PackageHandler.new "objects_5_0_perimeter_original2.c", "perimeter_original2.pol"
        #topo = Topographer.new "../topographer/json_graph"

    # Colorize
        puts
        package_handler.colorize

    # Remove fully shadowed rules
        puts
        package_handler.remove_shadowed_rules

    # Tag zerohit rules
        #puts
        #package_handler.tag_zerohit_rules

    # Remove unused objects
        puts
        package_handler.remove_unused

    # Remove duplicate objects
        puts
        package_handler.remove_duplicates




    # Exports
        puts
        puts "------>> Exporting Files (~10s)"
        package_handler.export_objects "objects_5_0_perimeter_custom.c"
        package_handler.export_policy "perimeter_custom.pol"

end_time = Time.now
# Print Statistics
    puts "< Statister >".rjust(30,"=").ljust(46,"=")
    puts
    puts "Execution time: #{end_time-start_time}"
    package_handler.print_objects_stats
    puts
    package_handler.print_policy_stats
    puts
    package_handler.print_color_stats


