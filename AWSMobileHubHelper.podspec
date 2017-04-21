Pod::Spec.new do |s|
  s.name         = 'AWSMobileHubHelper'
  s.version      = '2.5.5'
  s.summary      = 'The AWS Mobile Hub simplifies the process of building, testing, and monitoring.'
  s.description  = 'The AWS Mobile Hub simplifies the process of building, testing, and monitoring mobile applications that make use of one or more AWS services. It helps you skip the heavy lifting of integrating and configuring services by letting you add and configure features to your apps, including user authentication, data storage, backend logic, push notifications, content delivery, and analytics—all from a single, integrated console.'

  s.homepage     = 'http://aws.amazon.com/mobile/sdk'
  s.license      = 'Apache License, Version 2.0'
  s.author       = { 'Amazon Web Services' => 'amazonwebservices' }
  s.platform     = :ios, '8.0'
  s.source       = { :git => 'https://github.com/aws/aws-mobilehub-helper-ios.git' }
  s.requires_arc = true
  s.default_subspec = 'Core'
  s.dependency 'AWSCore', '2.5.5'

  s.subspec 'Core' do |ss|
    ss.dependency 'AWSMobileHubHelper/Authorization/Base'
    ss.dependency 'AWSMobileHubHelper/SignIn/Base'
  end

  s.subspec 'Authorization' do |ss|
    ss.subspec 'Base' do |ss|
      ss.source_files = 'AWSMobileHubHelper/Authorization/{AWSAuthorizationManager, AWSAuthorizer}.{h,m}'
      ss.framework = 'SafariServices'
    end

    ss.subspec 'Hubspot' do |ss|
      ss.source_files = 'AWSMobileHubHelper/Authorization/{AWSHubspotAuthorizationManager}.{h,m}'
      ss.dependency 'AWSMobileHubHelper/Authorization/Base'
    end

    ss.subspec 'Marketo' do |ss|
      ss.source_files = 'AWSMobileHubHelper/Authorization/{AWSMarketoAuthorizationManager}.{h,m}'
      ss.dependency 'AWSMobileHubHelper/Authorization/Base'
    end

    ss.subspec 'MSDynamics' do |ss|
      ss.source_files = 'AWSMobileHubHelper/Authorization/{AWSMSDynamicsAuthorizationManager}.{h,m}'
      ss.dependency 'AWSMobileHubHelper/Authorization/Base'
    end

    ss.subspec 'Quickbooks' do |ss|
      ss.source_files = 'AWSMobileHubHelper/Authorization/{AWSQuickbooksAuthorizationManager}.{h,m}'
      ss.dependency 'AWSMobileHubHelper/Authorization/Base'
    end

    ss.subspec 'Salesforce' do |ss|
      ss.source_files = 'AWSMobileHubHelper/Authorization/{AWSSalesforceAuthorizationManager}.{h,m}'
      ss.dependency 'AWSMobileHubHelper/Authorization/Base'
    end

    ss.subspec 'Zendesk' do |ss|
      ss.source_files = 'AWSMobileHubHelper/Authorization/{AWSZendeskAuthorizationManager}.{h,m}'
      ss.dependency 'AWSMobileHubHelper/Authorization/Base'
    end
  end

  s.subspec 'CloudLogic' do |ss|
    ss.source_files = 'AWSMobileHubHelper/CloudLogic/*.{h,m}'
    ss.dependency 'AWSLambda', '2.5.5'
  end

  s.subspec 'ContentDelivery' do |ss|
    ss.source_files = 'AWSMobileHubHelper/ContentDelivery/*.{h,m}'
    ss.dependency 'AWSS3', '2.5.5'
  end

  s.subspec 'Identity' do |ss|
    ss.source_files = 'AWSMobileHubHelper/Identity/*.{h,m}'
  end

  s.subspec 'Push' do |ss|
    ss.source_files = 'AWSMobileHubHelper/Push/*.{h,m}'
    ss.dependency 'AWSSNS', '2.5.5'
  end

  s.subspec 'UserFiles' do |ss|
    ss.source_files = 'AWSMobileHubHelper/UserFiles/{*}.{h,m}'
    ss.dependency 'AWSMobileHubHelper/SignIn/Base'
    ss.dependency 'AWSMobileHubHelper/ContentDelivery'
  end

  s.subspec 'SignIn' do |ss|
    ss.subspec 'Base' do |ss|
      ss.source_files = 'AWSMobileHubHelper/SignIn/{AWSCognitoUserPoolsSignInProvider,AWSSAMLSignInProvider,AWSSignInProvider,AWSSignInProviderFactory}.{h,m}'
      ss.dependency 'AWSMobileHubHelper/Identity'
      ss.dependency 'AWSCognitoIdentityProvider', '2.5.5'
      ss.dependency 'AWSCognito', '2.5.5'
    end

    ss.subspec 'Facebook' do |ss|
      ss.source_files = 'AWSMobileHubHelper/SignIn/{AWSFacebookSignInProvider}.{h,m}'
      ss.dependency 'AWSMobileHubHelper/SignIn/Base'
      ss.dependency 'FBSDKLoginKit', '~> 4.22.0'
      ss.dependency 'FBSDKCoreKit', '~> 4.22.0'
    end

    ss.subspec 'Google' do |ss|
      ss.source_files = 'AWSMobileHubHelper/SignIn/{AWSGoogleSignInProvider}.{h,m}'
      ss.dependency 'AWSMobileHubHelper/SignIn/Base'
      ss.dependency 'GoogleSignIn', '~> 4.0.2'
    end
  end
end
