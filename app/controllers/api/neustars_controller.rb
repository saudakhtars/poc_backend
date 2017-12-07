class Api::NeustarsController < ApplicationController

  skip_before_filter  :verify_authenticity_token
  skip_before_action :set_current_user, :authenticate_request

  def users_data
    if params[:access_token].present? && params[:phone_number].present?
      phone_number = params[:phone_number]
      number = phone_number[-1]
      @user = case number
              when '1'
                first_user
              when '2'
                second_user
              when '3'
                third_user
              when '4'
                fourth_user
              when '5'
                fifth_user
              when '6'
                sixth_user
              when '7'
                seventh_user
              when '8'
                eighth_user
              when '9'
                ninth_user
              when '0'
                tenth_user
              else
                'not a user'
              end
      render json: @user, status: 200
    else
      render json: { error: 'Not Authorized'}, status: 401
    end 
  end

  def create
    phone_number = params[:phone_number]
    if params[:access_token].present?
      render json: phone_number, status: 200
    else
      render json: { error: 'Not Authorized'}, status: 401
    end
  end

  # def push_notification
  #   app = Rpush::Apns::App.new
  #   if !Rpush::Apns::App.find_by_name("Feustar")
  #     app.name = "Feustar"
  #     app.certificate = File.read("app/controllers/api/CallerAppPushCert.pem")
  #     app.environment = "development" # APNs environment.
  #     app.password = "cybage@123"
  #     app.connections = 1
  #     app.save!
  #   end

  #   n = Rpush::Apns::Notification.new
  #   n.app = Rpush::Apns::App.find_by_name("Feustar")
  #   n.device_token = "9C495CA7FB0FC97FE40757968134C31B6A995E9C867B5D579A14A4A4D253DADD" # 64-character hex string
  #   n.alert = "hi mom!"
  #   n.data = {"aps"=>{"alert"=>"Message","badge"=>"2","sound"=>"default"}}
  #   n.save!
  #   Rpush.push
  #   render json: params[:phone_number], status: 200
  # end

  def push_notification_ios
    #if params[:calling_number] == '8806908725'
      tokens = [
       "9C495CA7FB0FC97FE40757968134C31B6A995E9C867B5D579A14A4A4D253DADD"
      ]
      password = 'cybage@123' # optional password for .pem file

      notification = RubyPushNotifications::APNS::APNSNotification.new tokens, { aps: { alert: caller_name, sound: 'true', badge: 1 } }

      pusher = RubyPushNotifications::APNS::APNSPusher.new(File.read('app/controllers/api/CallerAppPushCert.pem'), true, password)
      pusher.push [notification]
      render json: params[:calling_number], status: 200
    #else
      #render plain: 'Not an ios number', status: 200
    #end
  end

  def report_spam
    spam = Spam.find_by_phone_number(params[:phone_number])
    if spam.present?
      count = spam.count + 1
      spam.count = count
      spam.save!
      render plain: 'Updated', status: 200
    else
      spam = Spam.create(phone_number: params[:phone_number], count: 1)
      render plain: 'Created', status: 200
    end 
  end

  def caller_name
    caller_number = params[:caller_number]
    number = caller_number[-1]
    message = case number
              when '1'
                "Call from Kane with number #{caller_number} Identified by NeuStar"
              when '2'
                "Call from Neil with number #{caller_number} Identified by NeuStar"
              when '3'
                "Call from Stephen with number #{caller_number} Identified by NeuStar"
              when '4'
                "Call from Martin with number #{caller_number} Identified by NeuStar"
              when '5'
                "Call from Smith with number #{caller_number} Identified by NeuStar"
              when '6'
                "Call from David with number #{caller_number} Identified by NeuStar"
              when '7'
                "Call from Michael with number #{caller_number} Identified by NeuStar"
              when '8'
                "Call from Ben with number #{caller_number} Identified by NeuStar"
              when '9'
                "Call from Andrew with number #{caller_number} Identified by NeuStar"
              when '0'
                "Call from Peter with number #{caller_number} Identified by NeuStar"
              else
                "Call from Vipin with number #{caller_number} Identified by NeuStar"
              end
    return message
  end

  def first_user
    { 
      "business_name" => "AT&T U-verse", 
      "department" => "Sales",
      "phone_number"=> params[:phone_number], 
      "line_type" => "wireline", 
      "business_type" => "CABLE TELEVISION SERVICES", 
      "business_address" => "1501 4TH AVE STE 116", 
      "locality" => "SEATTLE, WA", 
      "postal_code" => "98101-1662", 
      "website_url" => "http://attsavings.com/u-verse", 
      "logo_url" => "https://ideatorpoc.herokuapp.com/assets/img/user01.png",
      "spam_count" => spam_count
    } 
  end

  def second_user
    { 
      "business_name" => "Airtel", 
      "department" => "Sales",
      "phone_number"=> params[:phone_number], 
      "line_type" => "wireline", 
      "business_type" => "CABLE TELEVISION SERVICES", 
      "business_address" => "1501 4TH AVE STE 116", 
      "locality" => "SEATTLE, WA", 
      "postal_code" => "98101-1662", 
      "website_url" => "http://airtel.com/", 
      "logo_url" => "https://ideatorpoc.herokuapp.com/assets/img/user05.png",
      "spam_count" => spam_count
    } 
  end

   def third_user
    { 
      "business_name" => "Vodafone", 
      "department" => "Sales",
      "phone_number"=> params[:phone_number], 
      "line_type" => "wireline", 
      "business_type" => "CABLE TELEVISION SERVICES", 
      "business_address" => "1501 4TH AVE STE 116", 
      "locality" => "SEATTLE, WA", 
      "postal_code" => "98101-1662", 
      "website_url" => "http://vodafone.com/", 
      "logo_url" => "https://ideatorpoc.herokuapp.com/assets/img/user03.png",
      "spam_count" => spam_count  
    } 
  end

   def fourth_user
    { 
      "business_name" => "Apple", 
      "department" => "Sales",
      "phone_number" => params[:phone_number], 
      "line_type" => "wireline", 
      "business_type" => "CABLE TELEVISION SERVICES", 
      "business_address" => "1501 4TH AVE STE 116", 
      "locality" => "SEATTLE, WA", 
      "postal_code" => "98101-1662", 
      "website_url" => "http://apple.com/", 
      "logo_url" => "https://ideatorpoc.herokuapp.com/assets/img/Carter-Wigell.png",
      "spam_count" => spam_count 
    } 
  end

   def fifth_user
    { 
      "business_name" => "Samsung", 
      "department" => "Sales",
      "phone_number"=> params[:phone_number], 
      "line_type" => "wireline", 
      "business_type" => "CABLE TELEVISION SERVICES", 
      "business_address" => "1501 4TH AVE STE 116", 
      "locality" => "SEATTLE, WA", 
      "postal_code" => "98101-1662", 
      "website_url" => "http://samsung.com/", 
      "logo_url" => "https://ideatorpoc.herokuapp.com/assets/img/charlie-smith.png",
      "spam_count" => spam_count 
    } 
  end

   def sixth_user
    { 
      "business_name" => "One Plus", 
      "department" => "Sales",
      "phone_number"=> params[:phone_number], 
      "line_type" => "wireline", 
      "business_type" => "CABLE TELEVISION SERVICES", 
      "business_address" => "1501 4TH AVE STE 116", 
      "locality" => "SEATTLE, WA", 
      "postal_code" => "98101-1662", 
      "website_url" => "http://oneplus.com/", 
      "logo_url" => "https://ideatorpoc.herokuapp.com/assets/img/img03.png",
      "spam_count" => spam_count
    } 
  end

   def seventh_user
    { 
      "business_name" => "Dell", 
      "department" => "Sales",
      "phone_number"=> params[:phone_number], 
      "line_type" => "wireline", 
      "business_type" => "CABLE TELEVISION SERVICES", 
      "business_address" => "1501 4TH AVE STE 116", 
      "locality" => "SEATTLE, WA", 
      "postal_code" => "98101-1662", 
      "website_url" => "http://dell.com/", 
      "logo_url" => "https://ideatorpoc.herokuapp.com/assets/img/Ray-Arata.png",
      "spam_count" => spam_count
    } 
  end

   def eighth_user
    { 
      "business_name" => "Lenovo", 
      "department" => "Sales",
      "phone_number"=> params[:phone_number], 
      "line_type" => "wireline", 
      "business_type" => "CABLE TELEVISION SERVICES", 
      "business_address" => "1501 4TH AVE STE 116", 
      "locality" => "SEATTLE, WA", 
      "postal_code" => "98101-1662", 
      "website_url" => "http://lenovo.com/", 
      "logo_url" => "https://ideatorpoc.herokuapp.com/assets/img/bindi-karia.png",
      "spam_count" => spam_count
    } 
  end

   def ninth_user
    { 
      "business_name" => "Sony", 
      "department" => "Sales",
      "phone_number"=> params[:phone_number], 
      "line_type" => "wireline", 
      "business_type" => "CABLE TELEVISION SERVICES", 
      "business_address" => "1501 4TH AVE STE 116", 
      "locality" => "SEATTLE, WA", 
      "postal_code" => "98101-1662", 
      "website_url" => "http://sony.com/", 
      "logo_url" => "https://ideatorpoc.herokuapp.com/assets/img/Julie-Trell.png",
      "spam_count" => spam_count
    } 
  end

   def tenth_user
    { 
      "business_name" => "HP", 
      "department" => "Sales",
      "phone_number"=> params[:phone_number], 
      "line_type" => "wireline", 
      "business_type" => "CABLE TELEVISION SERVICES", 
      "business_address" => "1501 4TH AVE STE 116", 
      "locality" => "SEATTLE, WA", 
      "postal_code" => "98101-1662", 
      "website_url" => "http://hp.com/",
      "logo_url" => "https://ideatorpoc.herokuapp.com/assets/img/aber.png",
      "spam_count" => spam_count
    } 
  end

  def spam_count
    spam = Spam.find_by_phone_number(params[:phone_number])
    if spam.present?
      spam.count
    else
      0
    end
  end
end
