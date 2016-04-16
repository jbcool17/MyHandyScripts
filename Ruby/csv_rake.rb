require 'csv'

# Ex. rake csv:load_infos[/home/john/Projects/CSV-Ruby/infos.csv]


namespace :csv do  
  
  desc "loads infos from csv file" # :arg1 is for command line input
  task :load_infos, [:arg1] => :environment do |task, args|
    infos = process_csv(args[:arg1])
    create_infos(infos)
  end

  desc "delete infos from csv file"
  task :delete_infos, [:arg1] => :environment do |task, args|
    infos = process_csv(args[:arg1])
    delete_infos(infos)
  end
  
  private

  def output(message)
    puts "HELLO! #{message} #{t}"
  end

  # Create array of hashes from CSV
  def process_csv(file)
    data = CSV.read(file, {encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all})
    hashed_data = data.map { |d| d.to_hash } 
   
    puts "CSV Loaded..."

    return hashed_data
  end

  # Add infos to database
  def create_infos(infos)
    # info Create
    infos.each do |record|
      
      # Start
      info = info.new
      
      #Add data
      info.name = record[:info_name]
      info.short_name = record[:short_name]
      info.industry_id = lookup_industry_id(record[:industry]) # format: 4e9fab7aa6c2321681000026 / lookup_industry_id(industry_name)
      info.active = true           
            
      # Save it!
      if info.valid?
        info.save!
        puts "The info #{record[:info_name]} has been added to the database."        
      else
        puts "Errors found with info: #{record[:info_name]}"
        puts "ERRORS: #{info.errors.full_messages}"
      end
     
      puts "---------------------------------------------------------------"
    end
    puts "DONE!"
  end

  # Delete infos to databas
  def delete_infos(infos)
    infos.each do |record|

      if info.where(name: record[:info_name]).exists?

        info = info.find_by({ name: record[:info_name] })
        info.destroy
        
        puts "#{record[:info_name]} has been deleted!"
      else
        puts "#{record[:info_name]} not found"
      end
      
      puts "-------------------------------------------"
    end
    puts "DONE!"
  end

  # Look up industry id
  def lookup_info_id(info_name)

    # Hash of names and ids / key, value
    Info_names = {}
    infos = Info.all.to_a

    infos.each do |industry|
      info_names[info.name] = info.id
    end

    # return id number
    puts "Info: #{info_names[info_name]} / #{info_name}"
    return info_names[info_name]

  end

end