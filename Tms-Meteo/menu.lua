-----------------------------------------------------------
-----------------------------------------------------------
-------------------- BY Terminus-Mik#4576  ----------------
-----------------------------------------------------------
-----------------------------------------------------------


Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(100)
    end
end)

------------------------------ MENU -------------------------------------



local menuColor = {66, 173, 245}
function MenuMeteo()

    RMenu.Add("meteo", "main", RageUI.CreateMenu("Menu Météo","Contrôle le temps"))
    RMenu:Get("meteo", "main").Closed = function()end
    RMenu:Get('meteo', 'main'):SetRectangleBanner(42, 48, 48, 255)
    RMenu.Add("heure", "main", RageUI.CreateSubMenu(RMenu:Get("meteo", "main"), "Heure", "Change le moment de la journée"))
    RMenu:Get("heure", "main").Closed = function()end
    RMenu.Add("temp", "main", RageUI.CreateSubMenu(RMenu:Get("meteo", "main"), "Temps", "Change la météo"))
    RMenu:Get("temp", "main").Closed = function()end
    RMenu.Add("blackout", "main", RageUI.CreateSubMenu(RMenu:Get("meteo", "main"), "Blackout", "!! ~r~ATTENTION~s~ !! appuyer qu'une seule fois "))
    RMenu:Get("blackout", "main").Closed = function()end
    RMenu.Add("divers", "main", RageUI.CreateSubMenu(RMenu:Get("meteo", "main"), "Divers", "Fait autre chose"))
    RMenu:Get("divers", "main").Closed = function()end



    RageUI.Visible(RMenu:Get('meteo', 'main'), not RageUI.Visible(RMenu:Get('meteo', 'main')))
        Citizen.CreateThread(function()
            local cooldown = false
            while true do
                Citizen.Wait(1.0)
                RageUI.IsVisible(RMenu:Get("meteo","main"),true,true,true,function()
                    
                    RageUI.ButtonWithStyle("Heure", "Vous permets de changer le moment de la journée", { RightLabel = "→→" }, not cooldown, function()
                    end, RMenu:Get('heure', 'main'))
                    RageUI.ButtonWithStyle("Temps", "Vous permets de changer la météo", { RightLabel = "→→" }, not cooldown, function()
                    end, RMenu:Get('temp', 'main'))
                    RageUI.ButtonWithStyle("Divers", "Vous permets de faire autre chose", { RightLabel = "→→" }, not cooldown, function()
                    end, RMenu:Get('divers', 'main'))
                    
                    


                    RageUI.Separator("↓ ~r~DANGER ~s~↓")

                    RageUI.ButtonWithStyle("Purge", "Vous permets de faire autre chose", { RightLabel = "→→" }, not cooldown, function(h,a,s)
                        if s then
                            ExecuteCommand("weather halloween")
                            TriggerServerEvent("purge", "Que la purge commence ")
                            cooldown = true
                            Citizen.SetTimeout(10000, function()
                                cooldown = false
                            end)
                        end

                    end)

                    RageUI.ButtonWithStyle("Blackout", "Vous permets de mettre le chaos", { RightLabel = "→→" }, not cooldown, function()
                    end, RMenu:Get('blackout', 'main'))



                end, function()
                end, 1)
                RageUI.IsVisible(RMenu:Get("heure","main"),true,true,true,function()
                    RageUI.ButtonWithStyle("Jours", "Vous permez de mettre le jours sur la ville", { RightLabel = "→→" }, not cooldown, function(h,a,s)
                        if s then
                            ExecuteCommand("noon")
                            ESX.ShowAdvancedNotification("Horloge", "Vous venez de mettre le jour", "", 'CHAR_BEVERLY', 2)
                            cooldown = true
                            Citizen.SetTimeout(10000, function()
                                cooldown = false
                            end)
                        end
                    end)

                    RageUI.ButtonWithStyle("Nuit", "Vous permez de mettre la nuit sur la ville", { RightLabel = "→→" }, not cooldown, function(h,a,s)
                        if s then
                            ExecuteCommand("night")
                            ESX.ShowAdvancedNotification("Horloge", "Vous venez de mettre la nuit", "", 'CHAR_BEVERLY', 2)
                            cooldown = true
                            Citizen.SetTimeout(10000, function()
                                cooldown = false
                            end)
                        end
                    end)




                end, function()
                end, 1)

                RageUI.IsVisible(RMenu:Get("temp","main"),true,true,true,function()

                   

                    RageUI.ButtonWithStyle("Soleil", "Vous permets de le soleil sur la ville", { RightLabel = "→→" }, not cooldown, function(h,a,s)
                        if s then
                            ExecuteCommand('weather extrasunny')
                            TriggerServerEvent("Soleil", "Les prévision annonce un temp ~y~Ensoleillé")
                            cooldown = true
                            Citizen.SetTimeout(10000, function()
                                cooldown = false
                            end)
                        end
                    end)

                    RageUI.ButtonWithStyle("Nuageux", "Vous permets des nuage", { RightLabel = "→→" }, not cooldown, function(h,a,s)
                        if s then
                            ExecuteCommand('weather overcast')
                            TriggerServerEvent("Soleil", "Les prévision annonce un temp ~c~Nuageux")
                            cooldown = true
                            Citizen.SetTimeout(10000, function()
                                cooldown = false
                            end)
                        end
                    end)

                    RageUI.ButtonWithStyle("Pluie", "Vous permets de la pluis", { RightLabel = "→→" }, not cooldown, function(h,a,s)
                        if s then
                            ExecuteCommand('weather rain')
                            TriggerServerEvent("Soleil", "Les prévision annonce de la ~b~Pluie")
                            cooldown = true
                            Citizen.SetTimeout(10000, function()
                                cooldown = false
                            end)
                        end
                    end)

                    
                    RageUI.ButtonWithStyle("Neige", "Vous permets de la neige", { RightLabel = "→→" }, not cooldown, function(h,a,s)
                        if s then
                            ExecuteCommand('weather snow')
                            TriggerServerEvent("Soleil", "Les prévision annonce de la ~w~Neige")
                            cooldown = true
                            Citizen.SetTimeout(10000, function()
                                cooldown = false
                            end)
                        end
                    end)

                    RageUI.Separator("↓ ~r~Tempête ~s~↓")
                    
                    --[[RageUI.ButtonWithStyle("Pluie", "Vous permets de faire une tempête de pluis", { RightLabel = "→→" }, true, function(h,a,s)
                        if s then
                            ExecuteCommand('weather ')
                            TriggerServerEvent("pluie", "Les prévision annonce une tempête ~r~de pluie")
                        end
                    end)]]
                    RageUI.ButtonWithStyle("Orage", "Vous permets de faire une tempête d'orage", { RightLabel = "→→" }, not cooldown, function(h,a,s)
                        if s then
                            ExecuteCommand('weather thunder')
                            TriggerServerEvent("orage", "Les prévision annonce une tempête ~r~d'orage")
                            cooldown = true
                            Citizen.SetTimeout(10000, function()
                                cooldown = false
                            end)
                        end
                    end)
                    RageUI.ButtonWithStyle("Neige", "Vous permets de faire une tempête de neige", { RightLabel = "→→" }, not cooldown, function(h,a,s)
                        if s then
                            ExecuteCommand('weather blizzard')
                            TriggerServerEvent("orage", "Les prévision annonce une tempête de ~r~ Neige")
                            cooldown = true
                            Citizen.SetTimeout(10000, function()
                                cooldown = false
                            end)
                        end
                    end)


                end, function()
                end, 1)
                RageUI.IsVisible(RMenu:Get("divers","main"),true,true,true,function()

                
                    RageUI.ButtonWithStyle("Neige", "Vous permets de mettre de la neige partout", { RightLabel = "→→" }, not cooldown, function(h,a,s)
                        if s then
                            ExecuteCommand('weather xmas')
                            TriggerServerEvent("orage", "Tout la ville est sous la neige")
                            cooldown = true
                            Citizen.SetTimeout(10000, function()
                                cooldown = false
                            end)
                        end
                    end)


                end, function()
                end, 1)

                RageUI.IsVisible(RMenu:Get("blackout","main"),true,true,true,function()

                
                    RageUI.ButtonWithStyle("~g~Activer", "Vous permets de mettre de la neige partout", { RightLabel = "→→" }, not cooldown, function(h,a,s)
                        if s then
                            ExecuteCommand('blackout')
                            TriggerServerEvent("blackout", "La ville est plongé dans le noire. \n On fait notre possible pour arranger cela!!")
                            cooldown = true
                            Citizen.SetTimeout(10000, function()
                                cooldown = false
                            end)
                        end
                    end)

                                    
                    RageUI.ButtonWithStyle("~r~Désactiver ", "Vous permets de mettre de la neige partout", { RightLabel = "→→" }, not cooldown, function(h,a,s)
                        if s then
                            ExecuteCommand('blackout')
                            TriggerServerEvent("blackout", "L'électricité est de retour en ville")
                            cooldown = true
                            Citizen.SetTimeout(10000, function()
                                cooldown = false
                            end)
                        end
                    end)



                end, function()
                end, 1)


            end
        end)
end


RegisterCommand("meteo", function()
    MenuMeteo()
end, false)



-----------------------------------------------------------
-----------------------------------------------------------
-------------------- BY Terminus-Mik#4576 -----------------
-----------------------------------------------------------
-----------------------------------------------------------







