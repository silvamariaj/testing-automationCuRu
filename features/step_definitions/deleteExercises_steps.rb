

Given(/^that I want to delete the exercises created with "([^"]*)" and "([^"]*)"$/) do |userhr,password|

  $driver.manage.window.maximize
  $driver.find_element(:id, "username").send_keys userhr
  $driver.find_element(:id, "password").send_keys password
  $driver.find_element(:class, "btn-primary").click

  begin

    $driver.find_element(:class, "alert-success").displayed?
    puts("Login successful")

  rescue Exception => e
    fail!(raise(ArgumentError.new('Failed Test - Login Failed"!')))
    puts e.message
    Process.exit(0)

  end



end

Given(/^I enter into Exercises page$/) do

  if $FLAG_TEST_EXE == 1
    $driver.find_element(:xpath, ".//*[@id='navbar-collapse']/ul/li[5]/a/span/span[2]").click
    $driver.find_element(:xpath, "//li[contains(@class, 'dropdown pointer ng-scope open')]/ul[contains(@class, 'dropdown-menu')]/li[3]/a").click
  end

end

Then(/^I delete the exercises for profile "([^"]*)"$/) do|profile|

  if $FLAG_TEST_EXE == 1

#Count the total of elements to delete

    if $driver.find_elements(:css, 'ul.pagination.ng-scope li').size > 0

      #  puts "HAY MAS DE UNA PAGINA!!"

      values = []

      activos = $driver.find_elements(:css, 'ul.pagination.ng-scope li')

      pags = activos.count - 4

      a = 1

      if pags > 1

        paginas = []

        while a <= pags
# Create first row.

          paginas.push(a)
# Add first row.
          a = a + 1
        end

        values.push(paginas)

      end

      #  puts activos.count

      num = 2

      total = 0

      it = 0

      i = 1

      elem_x_borrar = []

      tot = 0
      while i <= pags


        it = it + 1

        if pags > 1

          num = num + 1
          tot = 0
          $driver.find_element(:xpath, "html/body/div[2]/div/div/div[3]/dir-pagination-controls/ul/li[" + num.to_s + "]/a").click

        end

        lista_td = $driver.find_elements(:xpath, "html/body/div[2]/div/div/div[2]/table/tbody/tr")

        cont =  lista_td.count

        puts "There is " + cont.to_s + " rows in the " + it.to_s + " page"

        ii = 1

        while ii <= cont do

          if $driver.find_element(:xpath, "//table/tbody/tr[" + ii.to_s + "]").text.include?(profile)

            total = total + 1
            puts "There is " + total.to_s + " rows in the " + it.to_s + " page"
            tot = tot + 1
            sleep(2)

          end

          ii = ii + 1

        end
        elem_x_borrar.push(tot)

        i = i + 1

      end

      values.push(elem_x_borrar)

      values.each do |x|
        x.each do |y|
          puts y
        end
        puts "--"
      end

      largo = paginas.count
      conta = 0

      while largo >= 1 and $driver.find_elements(:css, 'ul.pagination.ng-scope li').size > 0

        #puts "EL LARGO ES: " + largo.to_s

        while conta < elem_x_borrar[largo - 1]

          #puts "ESTAMOS EN LA PAGINA: " + largo.to_s
          #puts "EN ESTA PAGINA HAY " + elem_x_borrar[largo - 1].to_s + " ELEMENTOS PARA BORRAR"

          #CLICK IN THE LAST PAGE
          $driver.find_element(:xpath, "html/body/div[2]/div/div/div[3]/dir-pagination-controls/ul/li[" + (largo + 2).to_s + "]/a").click

          lista_td = $driver.find_elements(:xpath, "html/body/div[2]/div/div/div[2]/table/tbody/tr")

          cont =  lista_td.count


          ii = 1
          #SEARCH MATCHING ROWS
          while ii <= cont do

            if $driver.find_element(:xpath, "//table/tbody/tr[" + ii.to_s + "]").text.include?(profile)

              $driver.find_element(:xpath, "//table/tbody/tr[" + ii.to_s + "]/td[8]/div/button[3]").click
              sleep(1)
              $driver.find_element(:class, "btn-danger").click
              puts "Deleting exercise..."
              conta = conta + 1
              sleep(3)
              break
            end

            ii = ii + 1

          end #while
        end  #elem

        largo = largo - 1
        conta = 0

      end #while largo


    else

      #  puts "SOLO HAY UNA PAGINA!!"

      #contar elementos a borrar

      lista_td = $driver.find_elements(:xpath, "html/body/div[2]/div/div/div[2]/table/tbody/tr")

      cont =  lista_td.count

      #  puts "EL NUMERO DE FILAS EN LA PRIMERA PAGINA ES: " + cont.to_s
      contador = 0

      ii = 1
      #SEARCH MATCHING ROWS
      while ii <= cont do

        puts "ii es: " + ii.to_s

        if $driver.find_element(:xpath, "//table/tbody/tr[" + ii.to_s + "]").text.include?(profile)
          contador = contador + 1
        end

        ii = ii + 1

      end #while

      a = 0

      while a < contador

        lista_td = $driver.find_elements(:xpath, "html/body/div[2]/div/div/div[2]/table/tbody/tr")

        cont =  lista_td.count

        #  puts "EL NUMERO DE FILAS EN LA PRIMERA PAGINA ES: " + cont.to_s

        ii = 1
        #SEARCH MATCHING ROWS
        while ii <= cont do

         # puts "ii es: " + ii.to_s

          if $driver.find_element(:xpath, "//table/tbody/tr[" + ii.to_s + "]").text.include?(profile)
            $driver.find_element(:xpath, "//table/tbody/tr[" + ii.to_s + "]/td[8]/div/button[3]").click
            sleep(1)
            $driver.find_element(:class, "btn-danger").click
            puts "Deleting exercise..."
            a = a + 1
            sleep(3)
            break
          end

          ii = ii + 1

        end #while


      end


    end #primer size

  end #flag


  #Search for deleted rows


  if $driver.find_elements(:css, 'ul.pagination.ng-scope li').size > 0

    activos = $driver.find_elements(:css, 'ul.pagination.ng-scope li')

    pags = activos.count - 4

    num = pags + 3

    if pags > 1

      if activos.count > 1

        num = num - 1

        #FIRST FIND INTO LAST PAGE
        $driver.find_element(:xpath, "html/body/div[2]/div/div/div[3]/dir-pagination-controls/ul/li[" + num.to_s + "]/a").click

        lista_td = $driver.find_elements(:xpath, "html/body/div[2]/div/div/div[2]/table/tbody/tr")

        cont =  lista_td.count

        ii = 1


        while ii <= cont do

          if $driver.find_element(:xpath, "//table/tbody/tr[" + ii.to_s + "]").text.include?(profile)

            fail!(raise(ArgumentError.new('Failed Test - Were not deleted all the exercises!')))
            puts e.message
            Process.exit(0)

            break
          end

          ii = ii + 1

        end #while

      end


    else

      lista_td = $driver.find_elements(:xpath, "html/body/div[2]/div/div/div[2]/table/tbody/tr")

      cont =  lista_td.count

      ii = 1

      while ii <= cont do

        if $driver.find_element(:xpath, "//table/tbody/tr[" + ii.to_s + "]").text.include?(profile)

          fail!(raise(ArgumentError.new('Failed Test - Were not deleted all the exercises!')))
          puts e.message
          Process.exit(0)

          break
        end

        ii = ii + 1

      end#while

    end

  end

end
