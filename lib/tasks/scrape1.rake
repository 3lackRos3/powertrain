require 'open-uri'
require 'nokogiri'
require 'mechanize'



task :get_data3 => :environment do
		url = "http://www.powertrainproducts.net/Engines-s/1.htm?searching=Y&sort=5&cat=1&show=100&page=17"
        
		agent = Mechanize.new

		page  = agent.get(url)
		page.search('.v65-productDisplay .productnamecolor.colors_productname').each do |x|
			product_url = x['href']
			product_agent = Mechanize.new
			product = product_agent.get(product_url)
		    
		    noko = product.search('body')
			title = product.search('.productnamecolorLARGE').text
			p title
			if noko.xpath('//*[@itemprop="description"]').text.strip.length > 255
				subtitle = ""
			else
				subtitle = noko.xpath('//*[@itemprop="description"]').text.strip
			end
			p subtitle
			price = noko.xpath('//*[@itemprop="price"]').text.strip
			p price
			stock = noko.xpath('//*[@content]').last.attributes['content'].value
			p stock
			data = noko.xpath('//*[@itemprop="offers"]').text.split(/\r?\n/).reject { |c| c.empty? }
			if data[2].nil?
				availability = ""
			else
				buffer = data[2].slice! "Availability::"
		    	availability = data[2].to_s
		    end
		    p availability
		    if noko.css('#options_table span').last.nil?
		    	core = ""
		    else
		    	core = noko.css('#options_table span').last.text.sub!("Core", "").strip
		    end
			product_code = noko.css('.product_code').text
			p product_code
			images = []
			noko.css('#altviews a').each do |x|
				images << x['href']
			end
			p images
			description = noko.css('#ProductDetail_ProductDetails_div').last.text.strip
			p description
			features = noko.css('#ProductDetail_ProductDetails_div2').last.text.strip
			p features
			create_engine = Engine.create(title: title ,
													subtitle: subtitle,
													price: price,
													stock_status: stock,
													availability: availability,
													product_code: product_code,
													description: description + features ,
													image_urls: images.join(',') ,
													coreamount: core)
			application_table = noko.css('#ProductDetail_ExtInfo_div tbody tr')
			application_table.each_with_index do |x,index|
				next if index == 0
				make = x.css('td[1]').text.strip
				puts make
				model = x.css('td[2]').text.strip
				puts model
				year = x.css('td[3]').text.strip
				puts year
				cyl = x.css('td[4]').text.strip
				puts cyl
				size = x.css('td[5]').text.strip
				puts size
				drv = x.css('td[6]').text.strip
				puts drv
				vin = x.css('td[7]').text.strip
				puts vin
				options = x.css('td[8]').text.strip
				puts options
		        Application.create(make: make,engine_id: create_engine.id,model: model,year: year,cyl: cyl,size: size,drv: drv,vin: vin,options: options)
		    end
		end
end
						
							
						

			            
					