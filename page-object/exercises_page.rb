class ExercisesPage
  @timeout=3
  def self.delete_exercises(profile)
    @list_page = $driver.find_elements(:css, 'table.jh-table.table.table-striped tr').count - 1
    @count = 1
    @countmio = 0
    while @count<=@list_page do
      @countmio = @countmio + 1

      sleep(1)
      if $driver.find_element(:xpath, '/html/body/div[2]/div/div/div[2]/table/tbody/tr['+@count.to_s+']').text.include? profile
        $driver.find_element(:xpath, '/html/body/div[2]/div/div/div[2]/table/tbody/tr['+@count.to_s+']/td[8]/div/button[3]').click
        sleep(1)
        $driver.find_element(:xpath, '/html/body/div[1]/div/div/form/div[3]/button[2]').click
        sleep(1)
        @count = 0
        @list_page = $driver.find_elements(:css, 'table.jh-table.table.table-striped tr').count - 1
      end
      if  @list_page==20 && @count == 20

        @count = 0
        focus_item = $driver.find_elements(:css, 'li.ng-scope.active').last
        all_items = $driver.find_elements(:css, 'ul.pagination.ng-scope li a').keep_if{|x| x.text=~ /[0-9]/}

        if focus_item.text.to_i<all_items.last.text.to_i
          all_items.each do |page|
            page.click if page.text.to_i == focus_item.text.to_i+1
            sleep(3)
            @list_page = $driver.find_elements(:css, 'table.jh-table.table.table-striped tr').count - 1
          end
        end

      end
      @count = @count + 1
    end
    sleep(@timeout)
  end
  def self.check_exercises(profile)

    @list_page = $driver.find_elements(:css, 'table.jh-table.table.table-striped tr').count - 1
    @count = 1
    @countexercises = 0
    while @count<=@list_page do
      @countmio = @countmio + 1

      sleep(1)

      if $driver.find_element(:xpath, '/html/body/div[2]/div/div/div[2]/table/tbody/tr['+@count.to_s+']').text.include? profile
        @countexercises= @countexercises + 1
        sleep(1)
        @list_page = $driver.find_elements(:css, 'table.jh-table.table.table-striped tr').count - 1
      end
      if  @list_page==20 && @count == 20
        @count=0

        focus_item = $driver.find_elements(:css, 'li.ng-scope.active').last
        all_items = $driver.find_elements(:css, 'ul.pagination.ng-scope li a').keep_if{|x| x.text=~ /[0-9]/}

        if focus_item.text.to_i<all_items.last.text.to_i
          all_items.each do |page|
            page.click if page.text.to_i == focus_item.text.to_i+1
            sleep(3)
            @list_page = $driver.find_elements(:css, 'table.jh-table.table.table-striped tr').count - 1
          end
        end

      end
      @count = @count + 1
    end
    if @countexercises > 0
      puts @countexercises.to_s+' exercises'
      return true
    else
      puts 'No exercises'
      return false
    end
  end

end












