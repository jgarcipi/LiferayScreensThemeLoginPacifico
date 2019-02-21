Pod::Spec.new do |s|
    s.name = 'LiferayScreensThemeLoginPacifico'
    s.version = '1.0'
    s.summary = 'Your theme description'

    s.homepage     = 'https://www.liferay.com/liferay-screens'
    
    s.license = { 
		:type => 'MIT', 
		:file => 'LICENSE.md'
	}

    s.source = {
        :git => 'https://github.com/jgarcipi/LiferayScreensThemeLoginPacifico.git',
        :tag => '0.1.0'
    }

    s.authors = {
		'jhonly junior garcia pitoy' => 'juniorthebest70@gmail.com',
		'jhonly garcia pitoy' => 'jhonly_thebest1@hotmail.com'
	}

    s.platform = :ios, '9.0'
    s.requires_arc = true

    s.source_files = 'LiferayScreensThemeLoginPacifico/**/*.{h,m,swift}'
    s.resources = 'LiferayScreensThemeLoginPacifico/**/*.{xib,png,plist,lproj}'

    s.dependency 'LiferayScreens'
end
