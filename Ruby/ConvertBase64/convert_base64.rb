require 'httparty'

module Convert
  class Base64

    class << self
      # Step 1 - Gets Company Object Data from Database
      def add_logo_to_company(truth_company)
        conversion_process(truth_company)
      end

      # Step 2
      def conversion_process(response)
        # Building Base64 String

        image_string = "data:#{response['LogoMimeType']};base64,#{response['LogoBase64']}"
        image_data = split_base64(image_string)
        # accept jpg jpeg png
        if ((image_data[:extension].downcase.end_with? "jpg") || (image_data[:extension].downcase.end_with? "jpeg") || (image_data[:extension].downcase.end_with? "png"))
          # Build filename
          image_info = { :filename => "#{response['CompanyId']}", :extension => ".#{image_data[:extension]}" }

          return convert_data_uri_to_upload(image_info, image_data, image_string)
        else
          return nil
        end

      end

      # Step 3 - parse string
      def split_base64(uri_str)
        if uri_str.match(%r{^data:(.*?);(.*?),(.*)$})
          uri = Hash.new
          uri[:type] = $1 # "image/gif"
          uri[:encoder] = $2 # "base64"
          uri[:data] = $3 # data string
          uri[:extension] = $1.split('/')[1] # "gif"

          return uri
        else
          return nil
        end
      end

      # Step 4
      def convert_data_uri_to_upload(image_info, image_data, image_string)
        if image_string.try(:match, %r{^data:(.*?);(.*?),(.*)$})
          image_data_string = image_data[:data]

          # Convert to binary
          image_data_binary = Base64.decode64(image_data_string)

          # Creating tempfile with file name
          temp_img_file = Tempfile.new([image_info[:filename], image_info[:extension]], "tmp/")
          temp_img_file.binmode

          # Adding base64 decoded data
          temp_img_file << image_data_binary
          temp_img_file.rewind
          temp_img_file.close

          image_params = {:filename => "#{image_info[:filename]}#{image_info[:extension]}", :type => image_data[:type], :tempfile => temp_img_file}
          uploaded_file = ActionDispatch::Http::UploadedFile.new(image_params)

        end
      end

      # Convert Utilities
      def convert_to_image(base_64_encoded_data, image_name)
        File.open("tmp/#{image_name}.jpg", "wb") do|f|
          f.write(Base64.decode64(base_64_encoded_data))
        end
      end

      def convert_to_base64(image)
        Base64.encode64(File.open(image, "rb").read)
      end

    end

  end
end
end
