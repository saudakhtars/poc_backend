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
      "logo_url" => "https://ideatorpoc.herokuapp.com/assets/img/user01.png"
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
      "logo_url" => "https://ideatorpoc.herokuapp.com/assets/img/user05.png" 
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
      "logo_url" => "https://ideatorpoc.herokuapp.com/assets/img/user03.png"  
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
      "logo_url" => "https://ideatorpoc.herokuapp.com/assets/img/Carter-Wigell.png" 
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
      "logo_url" => "https://ideatorpoc.herokuapp.com/assets/img/charlie-smith.png" 
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
      "logo_url" => "https://ideatorpoc.herokuapp.com/assets/img/img03.png" 
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
      "logo_url" => "https://ideatorpoc.herokuapp.com/assets/img/Ray-Arata.png"
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
      "logo_url" => "https://ideatorpoc.herokuapp.com/assets/img/bindi-karia.png"
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
      "logo_url" => "https://ideatorpoc.herokuapp.com/assets/img/Julie-Trell.png"
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
      "logo_url" => "https://ideatorpoc.herokuapp.com/assets/img/aber.png"
    } 
  end
end
