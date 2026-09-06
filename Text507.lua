repeat task.wait() until game:IsLoaded()

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game:GetService("CoreGui")
screenGui.DisplayOrder = 999999
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TextService = game:GetService("TextService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

--==================================================
-- CONFIGURACIÓN
--==================================================

-- NOMBRES DE LOS MENÚS IZQUIERDOS
local menuNames = {
    ["MAIN"] = "PLAYER MENU",
    ["ESP"] = "ESP",
    ["COMBATE"] = "FIGHT SYSTEM",
    ["AUTO"] = "M1",
    ["TELEPORT"] = "ETAPA",
    ["LABELS"] = "LABELS",
    ["FPS"] = "FPS",
    ["YOUTUBE"] = "YOUTUBE",
}

--==================================================
-- COLOR DE LOS TÍTULOS GRANDES DERECHOS
--==================================================

local menuTitleColors = {
    ["MAIN"] = Color3.fromRGB(255,255,255),
    ["ESP"] = Color3.fromRGB(0,255,255),
    ["COMBATE"] = Color3.fromRGB(255,0,0),
    ["AUTO"] = Color3.fromRGB(0,255,0),
    ["TELEPORT"] = Color3.fromRGB(0,170,255),
    ["LABELS"] = Color3.fromRGB(255,255,0),
    ["FPS"] = Color3.fromRGB(255,0,255),
    ["YOUTUBE"] = Color3.fromRGB(255,0,0),
}

--==================================================
-- COLOR DEL TEXTO DE LOS MENÚS IZQUIERDOS
-- SOLO TEXTO, NO FONDO
--==================================================

local leftMenuTextColors = {

    ["MAIN"] = Color3.fromRGB(255,255,0),
    ["ESP"] = Color3.fromRGB(0,255,255),
    ["COMBATE"] = Color3.fromRGB(255,0,0),
    ["AUTO"] = Color3.fromRGB(0,255,0),
    ["TELEPORT"] = Color3.fromRGB(0,170,255),
    ["LABELS"] = Color3.fromRGB(255,255,0),
    ["FPS"] = Color3.fromRGB(255,0,255),
    ["YOUTUBE"] = Color3.fromRGB(255,0,0),

}

--==================================================
-- COLOR DEL TEXTO DE LOS BOTONES DERECHOS
--==================================================

local rightButtonTextColors = {

    ["SPEED"] = Color3.fromRGB(255,255,0),
    ["JUMPPOWER"] = Color3.fromRGB(0,255,255),
    ["GRAVITY"] = Color3.fromRGB(255,100,100),
    ["FLY"] = Color3.fromRGB(0,255,0),
    ["LOCALPLAYER"] = Color3.fromRGB(255,0,255),

}

--==================================================
-- DESCRIPCIONES
--==================================================

local buttonDescriptions = {

    ["SPEED"] =
        "Cambia la velocidad del jugador.",

    ["JUMPPOWER"] =
        "Cambia la fuerza con la que salta el jugador.",

    ["GRAVITY"] =
        "Modifica la gravedad del jugador.",

    ["FLY"] =
        "Activa el vuelo del jugador.",

    ["FLY SPEED"] =
        "Cambia la velocidad de movimiento mientras estás volando.",

    ["INVISIBLE"] =
        "Hace que tu personaje sea invisible para los demás jugadores.",

    ["NOCLIP"] =
        "Permite atravesar paredes y otros objetos.",

    ["LOCALPLAYER"] =
        "Modifica las opciones relacionadas con tu jugador.",

    ["ESP ULTI"] =
        "Muestra información visual relacionada con la habilidad.",

    ["RESET STATS"] =
        "Restablece las estadísticas modificadas del jugador.",

}

--==================================================
-- CONFIGURACIÓN NUMÉRICA
--==================================================

local numericBoxes = {

    ["SPEED"] = true,
    ["JUMPPOWER"] = true,
    ["GRAVITY"] = true,
    ["RANGE"] = true,
    ["SIZE"] = true,
    ["FLY SPEED"] = true,
    ["TRASPARENCY 0-1"] = true,
    ["FOV SIZE"] = true,
    ["BULLET SIZE"] = true,
    ["1 = 20"] = true,
    ["VELOCIDAD DE EL DISPARO"] = true,
    ["DAÑO DE EL DISPARO"] = true,
    ["ESCRIBE EL VALOR QUE QUIERES TENER"] = true,
    ["DAÑO"] = true,
    ["DAÑO EN BLOQUEO"] = true,
    ["FUERZA"] = true,
    ["GANANCIA PARA LA ESPECIAL"] = true,
    ["COOLDOWN DE LA ESPECIAL"] = true,
    ["CHANCE DE LA PASIVA"] = true,

}

--==================================================
-- BOTONES DOBLES
--==================================================

local doubleButtons = {
    ["AUTO ACAR VOLANDO"] = "NOMBRE DE EL JUGADO",
    ["PLAYER NAME"] = "TP TO PLAYER",
}

--==================================================
-- TÍTULOS
--==================================================

local topTitles = {

    ["ACTIVAR MODFICACIÓN"] = "MODIFICAR TOOLS",
    ["TP T"] = "TELEPORT",
    ["AUTO GANAR EN LA HABILIDAD Juicio Final"] = "GANAR",
    ["SPEED"] = "PLAYER",

}

local customTitles = {

    ["SPED"] = "MOVEMENT SETTINGS",
    ["TRSPARENCY 0-1"] = "OP",
    ["ESP NAE"] = "ESP VISUAL",

}

--==================================================
-- MULTI BUTTONS
--==================================================

local multiButtons = {

    [""] = {
        options = {

            {
                name = "MODE: BLE",
                variable = "OnlyVisie",
                color = Color3.fromRGB(0,255,0)
            },

            {
                name = "MODE: NO VISIBLE",
                variable = "aim_torso",
                color = Color3.fromRGB(255,0,0)
            },

        }
    },

    ["MODE: NO EQUIPPED KNIFE"] = {
        options = {

            {
                name = "MODE: ONLY EQUIPPED KNIFE",
                variable = "ONLY_EQUIPPED_KNIFE",
                color = Color3.fromRGB(0,255,0)
            },

            {
                name = "MODE: NO EQUIPPED KNIFE",
                variable = "NOU",
                color = Color3.fromRGB(255,0,0)
            },

        }
    },

    ["ESP COLOR"] = {
        options = {

            {
                name = "BLACK",
                variable = "esp_black",
                color = Color3.fromRGB(0,0,0)
            },

            {
                name = "RED",
                variable = "esp_red",
                color = Color3.fromRGB(255,0,0)
            },

            {
                name = "BLUE",
                variable = "esp_blue",
                color = Color3.fromRGB(0,100,255)
            },

        }
    },
}

--==================================================
-- TAMAÑO GLOBAL
--==================================================

local BUTTON_SIZE =
    UDim2.new(1,-20,0,30)

local BUTTON_OFFSET_X = 10
local BUTTON_GLOBAL_X = 0
local BUTTON_GLOBAL_Y = 0

--==================================================
-- TAMAÑOS PERSONALIZADOS
--==================================================

local BUTTON_CUSTOM = {

    ["DELAY"] = {
        size = UDim2.new(1,-50,0,27),
        x = 20,
        y = -6
    },

    ["NOMBRE DE EL JUGAD"] = {
        size = UDim2.new(1,-50,0,27),
        x = 20,
        y = -6
    },

    ["POWER"] = {
        size = UDim2.new(1,-50,0,27),
        x = 20,
        y = -6
    },

    ["COLOR OF THE ESP"] = {
        size = UDim2.new(1,-50,0,27),
        x = 20,
        y = -6
    },

    ["BULLET SIZE."] = {
        size = UDim2.new(1,-50,0,27),
        x = 20,
        y = -6
    },

    ["TRASPARENCY 0-"] = {
        size = UDim2.new(1,-50,0,27),
        x = 20,
        y = -9
    },

}

--==================================================
-- TÍTULOS DE BOTONES
--==================================================

local buttonTitles = {

    ["AUTO DISPARAR (EQUIPAR MINIGUN"] = "ARMA",
    ["KILL AURA (EQUIPAR BATON)"] = "BATON",
    ["JUMP(BUTTON)"] = "JUMP PAD",
    ["EXPANDIR HITBOX"] = "HITBOX",

    ["ACTIVAR CONFIGURACIÓN"] = "CONFIGURAR TOOLS",
    ["AUTO RECOLECTAR DINERO (RAPIDO)"] = "RECOLECCIÓN",

    ["TP A MUNDO 2"] = "MUNDOS",
    ["TP TOOL"] = "CLICK",
    ["NOMBRE DE EL JUGADOR"] = "JUGADORES",

    ["AUTO SACAR VOLANDO A TODOS"] = "FLING",
    ["AUTO MATAR A TODOS"] = "KILL",
    ["LAG SERVER (EQUIPAR BOMBA)"] = "SERVER",

    ["PLAYER NA"] = "FLING",
    ["TOUCH FLING"] = "TOUCH",
    ["ESP ENEMIES"] = "ENEMIES",
    ["ESP PLAYERS + NAME + DISTANCE"] = "PLAYERS",

    ["AUTO EAT"] = "EAT",
    ["SELF-HEALING"] = "HEALTH",

    ["AUTO KILL ENEMIES"] = "KILL",
    ["MULTIPLY DAMAGE"] = "DAMAGE MULTIPLIER",
    ["INFINITY AMMO"] = "MODIFY GUNS",
    ["INSTANT SWING"] = "MESH WEAPON MODIFICATIONS",

    ["NAME OF THE ITEM"] = "BRING",
    ["NAME OF THE ITEM."] = "GRAB",

    ["Fps Boost"] = "PERFORMANCE",

}

--==================================================
-- TOGGLES ROJOS
--==================================================

local redToggleButtons = {
    ["X-RAY"] = true,
    ["BULLET TRACERS"] = true,
}

getgenv().SBS_BUTTON_STATES =
    getgenv().SBS_BUTTON_STATES or {}

local buttonStates =
    getgenv().SBS_BUTTON_STATES

--==================================================
-- BOTONES SIN TOGGLE
--==================================================

local noToggleButtons = {

    ["YOUTUBE:SBS HUB"] = true,
    ["SUSCRIBETE:)"] = true,
    ["OBTENER TODAS LAS TOOLS"] = true,
    ["LOCALPLAYER"] = true,
    ["RESET STATS"] = true,
    ["DESNC"] = true,
    ["Fps Boost"] = true,
    ["REVIVIR"] = true,
    ["AUTO FARMEAR DINERO"] = true,
    ["ESTAR EN LA ETAPA 99.900M"] = true,
    ["COMPLETAR OBBY"] = true,
    ["SER GUARDIA"] = true,
    ["SER PRISIONERO"] = true,
    ["PARAR EL TIEMPO"] = true,
    ["TP A MUNDO 2"] = true,
    ["OBTENER SHIFTLOCK"] = true,
    ["TP A JUGADOR"] = true,
    ["MULTI SALTOS INFINITOS"] = true,
    ["SEMI-INMUNE"] = true,
    ["AUTO COMPLETAR"] = true,
    ["TP TO PLAYER"] = true,
    ["FLING PLAYER"] = true,
    ["OBTENER 999 DE SALTOS"] = true,
    ["SALTAR TODO"] = true,
    ["OBTENER SKIPS (Saltos)"] = true,

}

local noGreenFlash = {
    ["SUSCRIBETE:)"] = true
}

--==================================================
-- TEXTBOX
--==================================================

local textboxButtons = {

    ["SPEED"] = {
        variable = "SPEED",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Speed/refs/heads/main/Speed.lua"
    },

    ["BULLET SPEED"] = {
        variable = "BULLET_SPEED",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Text397/refs/heads/main/Text397.lua"
    },

    ["BULLETSPERSHOT"] = {
        variable = "BULLETS_PER_SHOT",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Text398/refs/heads/main/Text398.lua"
    },

    ["JUMPPOWER"] = {
        variable = "JUMP",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/JumpPower/refs/heads/main/JumpPower.lua"
    },

    ["GRAVITY"] = {
        variable = "GRAVITY",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Gravity/refs/heads/main/Gravity.lua"
    },

    ["ESCRIBE LA ETAPA QUE QUIERAS IR"] = {
        variable = "StageNumber",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Text66/refs/heads/main/Text66.lua"
    },

    ["FLY SPEED"] = {
        variable = "FLY_SPEED",
        url = nil
    },

    ["TAMAÑO"] = {
        variable = "HITBOX_SIZE",
        url = nil
    },

    ["TRANSPARENCIA 0-1"] = {
        variable = "HITBOX_TRANSPARENCY",
        url = nil
    },

    ["NOMBRE DE EL JUGADOR"] = {
        variable = "PLAYER",
        url = nil
    },

    ["ESCRIBE EL VALOR QUE QUIERES TENER"] = {
        variable = "Veces",
        url = nil
    },

    ["TIEMPO DE RECARGA"] = {
        variable = "FoodZookaSettings.ReloadTime",
        url = nil
    },

    ["FUERZA DE EL DISPARO"] = {
        variable = "FoodZookaSettings.Force",
        url = nil
    },

    ["VELOCIDAD DE EL DISPARO"] = {
        variable = "FoodZookaSettings.BulletSpeed",
        url = nil
    },

    ["NOMBRE DE EL JUGADOR_"] = {
        variable = "TargetPlayer2",
        url = nil
    },

    ["DAÑO DE EL DISPARO"] = {
        variable = "FoodZookaSettings.Damage",
        url = nil
    },

    ["DAÑO"] = {
        variable = "Damage",
        url = nil
    },

    ["DAÑO POR DEFECTO"] = {
        variable = "DefaultDamage",
        url = nil
    },

    ["DAÑO EN BLOQUEO"] = {
        variable = "BlockDamage",
        url = nil
    },

    ["FUERZA"] = {
        variable = "Force",
        url = nil
    },

    ["CHANCE DE LA PASIVA"] = {
        variable = "PassivaChance",
        url = nil
    },

    ["DISTANCIA DE LA DETECCIÓN DE M1"] = {
        variable = "Distance",
        url = nil
    },

    ["DISTANCIA DE LA DETECCIÓN DEL M1"] = {
        variable = "AUTO_F_DISTANCE",
        url = nil
    },

    ["GANANCIA PARA LA ESPECIAL"] = {
        variable = "SpecialBuildup",
        url = nil
    },

    ["COOLDOWN DE LA ESPECIAL"] = {
        variable = "SpecialCooldown",
        url = nil
    },

    ["PLAYER NAME."] = {
        variable = "TargetPlayerName",
        url = nil
    },

    ["FOV SIZE"] = {
        variable = "AIMBOT_FOV",
        url = nil
    },

    ["RANGO"] = {
        variable = "HitRadius",
        url = nil
    },

    ["XRAY-TRANSPARENCY"] = {
        variable = "XRAY_TRANSPARENCY",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Text433/refs/heads/main/Text433.lua"
    },

    ["1 = 20"] = {
        variable = "Timer",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Text343/refs/heads/main/Text343.lua"
    },

    ["POWER"] = {
        variable = "TouchFlingForce",
        url = nil
    },

}

--==================================================
-- BORRAR GUI ANTERIOR
--==================================================

local old =
    PlayerGui:FindFirstChild("SBS_HUB")

if old then
    old:Destroy()
end

screenGui.Name = "SBS_HUB"
screenGui.ResetOnSpawn = false

--==================================================
-- MAIN FRAME
--==================================================

local mainFrame =
    Instance.new("Frame",screenGui)

mainFrame.Size =
    UDim2.new(0,500,0,350)

mainFrame.Position =
    UDim2.new(0.5,-250,0.5,-175)

mainFrame.BackgroundColor3 =
    Color3.fromRGB(0,0,0)

mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = false

--==================================================
-- BORDE
--==================================================

local stroke =
    Instance.new("UIStroke",mainFrame)

stroke.Color =
    Color3.fromRGB(255,255,255)

stroke.Thickness = 2

--==================================================
-- RESIZE
--==================================================

local resizeCorner =
    Instance.new("Frame",mainFrame)

resizeCorner.Size =
    UDim2.new(0,20,0,20)

resizeCorner.Position =
    UDim2.new(1,-20,1,-20)

resizeCorner.BackgroundColor3 =
    Color3.fromRGB(255,255,255)

resizeCorner.BackgroundTransparency = 0.5
resizeCorner.BorderSizePixel = 0
resizeCorner.ZIndex = 10

do

    local dragging = false
    local dragStart
    local startSize

    resizeCorner.InputBegan:Connect(function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseButton1
        or input.UserInputType ==
            Enum.UserInputType.Touch then

            dragging = true

            dragStart =
                input.Position

            startSize =
                Vector2.new(
                    mainFrame.AbsoluteSize.X,
                    mainFrame.AbsoluteSize.Y
                )

            input.Changed:Connect(function()

                if input.UserInputState ==
                    Enum.UserInputState.End then

                    dragging = false
                end

            end)

        end

    end)

    UserInputService.InputChanged:Connect(function(input)

        if dragging
        and (
            input.UserInputType ==
                Enum.UserInputType.MouseMovement
            or input.UserInputType ==
                Enum.UserInputType.Touch
        ) then

            local delta =
                input.Position - dragStart

            local newWidth =
                math.max(
                    300,
                    startSize.X + delta.X
                )

            local newHeight =
                math.max(
                    200,
                    startSize.Y + delta.Y
                )

            mainFrame.Size =
                UDim2.new(
                    0,newWidth,
                    0,newHeight
                )
        end

    end)

end

--==================================================
-- DRAG MAIN
--==================================================

do

    local dragging = false
    local dragStart
    local startPos
    local dragInput

    local function update(input)

        local delta =
            input.Position - dragStart

        mainFrame.Position =
            UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )

    end

    mainFrame.InputBegan:Connect(function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseButton1
        or input.UserInputType ==
            Enum.UserInputType.Touch then

            dragging = true

            dragStart =
                input.Position

            startPos =
                mainFrame.Position

            input.Changed:Connect(function()

                if input.UserInputState ==
                    Enum.UserInputState.End then

                    dragging = false
                end

            end)

        end

    end)

    mainFrame.InputChanged:Connect(function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseMovement
        or input.UserInputType ==
            Enum.UserInputType.Touch then

            dragInput = input

        end

    end)

    UserInputService.InputChanged:Connect(function(input)

        if input == dragInput
        and dragging then

            update(input)

        end

    end)

end

--==================================================
-- TITULO
--==================================================

local title =
    Instance.new("TextLabel",mainFrame)

title.Size =
    UDim2.new(1,0,0,50)

title.BackgroundColor3 =
    Color3.fromRGB(0,0,0)

title.Text =
    "SBS HUB | HYPER SPEED RUNNER"

title.TextColor3 =
    Color3.fromRGB(255,255,255)

title.Font =
    Enum.Font.GothamBold

title.TextScaled = true

--==================================================
-- LINEA
--==================================================

local line =
    Instance.new("Frame",mainFrame)

line.Size =
    UDim2.new(1,0,0,2)

line.Position =
    UDim2.new(0,0,0,50)

line.BackgroundColor3 =
    Color3.fromRGB(255,255,255)

line.BorderSizePixel = 0

--==================================================
-- LEFT
--==================================================

local leftFrame =
    Instance.new("ScrollingFrame",mainFrame)

leftFrame.Size =
    UDim2.new(0,150,1,-52)

leftFrame.Position =
    UDim2.new(0,0,0,52)

leftFrame.BackgroundColor3 =
    Color3.fromRGB(0,0,0)

leftFrame.BorderSizePixel = 0

leftFrame.ScrollBarThickness = 5
leftFrame.AutomaticCanvasSize =
    Enum.AutomaticSize.Y

--==================================================
-- RIGHT
--==================================================

local rightFrame =
    Instance.new("ScrollingFrame",mainFrame)

rightFrame.Size =
    UDim2.new(1,-150,1,-52)

rightFrame.Position =
    UDim2.new(0,150,0,52)

rightFrame.BackgroundColor3 =
    Color3.fromRGB(0,0,0)

rightFrame.BorderSizePixel = 0

rightFrame.ScrollBarThickness = 5
rightFrame.AutomaticCanvasSize =
    Enum.AutomaticSize.Y

--==================================================
-- LINEA CENTRAL
--==================================================

local midLine =
    Instance.new("Frame",mainFrame)

midLine.Size =
    UDim2.new(0,2,1,-52)

midLine.Position =
    UDim2.new(0,150,0,52)

midLine.BackgroundColor3 =
    Color3.fromRGB(255,255,255)

midLine.BorderSizePixel = 0

--==================================================
-- PADDING
--==================================================

local padding =
    Instance.new("UIPadding",rightFrame)

padding.PaddingBottom =
    UDim.new(0,50)

--==================================================
-- BOTÓN IZQUIERDO
--==================================================

local currentMenuButton = nil

local function createMenuButton(
    parent,
    text,
    y,
    callback
)

    local b =
        Instance.new("TextButton",parent)

    b.Size =
        UDim2.new(1,-20,0,30)

    b.Position =
        UDim2.new(0,10,0,y)

    b.Text =
        text

    -- FONDO NORMAL SIEMPRE NEGRO
    b.BackgroundColor3 =
        Color3.fromRGB(15,15,15)

    b.BorderSizePixel = 0

    -- COLOR DEL TEXTO
    local configuredColor =
        leftMenuTextColors[text]

    b.TextColor3 =
        configuredColor
        or Color3.fromRGB(255,255,255)

    b.Font =
        Enum.Font.GothamBold

    b.TextSize = 14

    --==================================================
    -- BRILLO SOLO DEL TEXTO
    --==================================================

    local textGlow =
        Instance.new("UIStroke")

    textGlow.Name =
        "TextGlow"

    textGlow.Thickness = 1.5

    textGlow.Transparency = 0.2

    textGlow.Color =
        configuredColor
        or Color3.fromRGB(255,255,255)

    textGlow.Parent =
        b

    --==================================================
    -- CLICK
    --==================================================

    b.MouseButton1Click:Connect(function()

        -- RESTAURAR EL ANTERIOR
        if currentMenuButton
        and currentMenuButton ~= b then

            currentMenuButton.BackgroundColor3 =
                Color3.fromRGB(15,15,15)

            local oldColor =
                leftMenuTextColors[
                    currentMenuButton.Text
                ]

            currentMenuButton.TextColor3 =
                oldColor
                or Color3.fromRGB(255,255,255)

            local oldGlow =
                currentMenuButton:FindFirstChild(
                    "TextGlow"
                )

            if oldGlow then

                oldGlow.Color =
                    oldColor
                    or Color3.fromRGB(255,255,255)

            end

        end

        --==================================================
        -- SELECCIONADO
        --==================================================

        -- EL FONDO SE VUELVE BLANCO
        b.BackgroundColor3 =
            Color3.fromRGB(255,255,255)

        -- EL TEXTO NO SE PONE NEGRO
        b.TextColor3 =
            configuredColor
            or Color3.fromRGB(0,0,0)

        -- EL BRILLO SIGUE SIENDO DEL TEXTO
        textGlow.Color =
            configuredColor
            or Color3.fromRGB(0,0,0)

        currentMenuButton = b

        callback()

    end)

end

--==================================================
-- ALTURA DE DESCRIPCIÓN
--==================================================

local function getDescriptionHeight(text)

    if not text or text == "" then
        return 0
    end

    local width =
        math.max(
            100,
            rightFrame.AbsoluteSize.X - 30
        )

    local result =
        TextService:GetTextSize(
            text,
            10,
            Enum.Font.Gotham,
            Vector2.new(width,1000)
        )

    return math.max(
        15,
        result.Y
    )

end

--==================================================
-- CREAR BOTÓN DERECHO
--==================================================

local function createButton(
    parent,
    text,
    y,
    callback
)

    local hasTextbox =
        textboxButtons[text] ~= nil

    local multiConfig =
        multiButtons[text]

    local container =
        Instance.new("Frame",parent)

    container.BackgroundTransparency = 1

    container.Position =
        UDim2.new(0,10,0,y)

    container.Size =
        UDim2.new(1,-20,0,30)

    --==================================================
    -- MULTI
    --==================================================

    if multiConfig then

        local button =
            Instance.new("TextButton",container)

        button.Size =
            UDim2.new(1,0,1,0)

        button.BackgroundColor3 =
            Color3.fromRGB(20,20,20)

        button.BorderSizePixel = 0

        button.Text = ""

        local label =
            Instance.new("TextLabel",button)

        label.Size =
            UDim2.new(1,0,1,0)

        label.BackgroundTransparency = 1

        label.Font =
            Enum.Font.GothamBold

        label.TextSize = 14

        getgenv().SBS_MULTI =
            getgenv().SBS_MULTI or {}

        local index =
            getgenv().SBS_MULTI[text] or 0

        local options =
            multiConfig.options

        local function update()

            if index == 0 then

                label.Text = text

                label.TextColor3 =
                    rightButtonTextColors[text]
                    or Color3.fromRGB(
                        255,255,255
                    )

            else

                local option =
                    options[index]

                label.Text =
                    option.name

                label.TextColor3 =
                    option.color

                for _,v in ipairs(options) do

                    if v.variable then
                        getgenv()[v.variable] = false
                    end

                end

                if option.variable then
                    getgenv()[option.variable] = true
                end

            end

        end

        update()

        button.MouseButton1Click:Connect(function()

            index += 1

            if index > #options then
                index = 1
            end

            getgenv().SBS_MULTI[text] =
                index

            update()

        end)

        return
    end

    --==================================================
    -- TEXTBOX
    --==================================================

    if hasTextbox then

        local box =
            Instance.new("TextBox",container)

        box.Size =
            UDim2.new(1,0,1,0)

        box.BackgroundColor3 =
            Color3.fromRGB(20,20,20)

        box.BorderSizePixel = 0

        box.PlaceholderText =
            text

        box.Text = ""

        box.TextColor3 =
            rightButtonTextColors[text]
            or Color3.fromRGB(255,255,255)

        box.Font =
            Enum.Font.GothamBold

        box.TextSize = 14

        local data =
            textboxButtons[text]

        box:GetPropertyChangedSignal(
            "Text"
        ):Connect(function()

            if numericBoxes[text] then

                box.Text =
                    box.Text:gsub(
                        "[^%d%.%-]",
                        ""
                    )

            end

        end)

        box.FocusLost:Connect(function()

            if box.Text == "" then
                return
            end

            local value

            if numericBoxes[text] then

                value =
                    tonumber(box.Text)

                if not value then
                    return
                end

            else

                value =
                    box.Text

            end

            getgenv()[data.variable] =
                value

            if data.url then

                pcall(function()

                    loadstring(
                        game:HttpGet(
                            data.url
                        )
                    )()

                end)

            end

        end)

    else

        --==================================================
        -- BOTÓN NORMAL
        --==================================================

        local button =
            Instance.new(
                "TextButton",
                container
            )

        button.Size =
            UDim2.new(1,0,1,0)

        button.Text =
            text

        button.BackgroundColor3 =
            Color3.fromRGB(20,20,20)

        button.BorderSizePixel = 0

        button.TextColor3 =
            rightButtonTextColors[text]
            or Color3.fromRGB(
                255,255,255
            )

        button.Font =
            Enum.Font.GothamBold

        button.TextSize = 14

        --==================================================
        -- TOGGLE
        --==================================================

        local isToggle =
            not noToggleButtons[text]

        if isToggle then

            if buttonStates[text] == nil then
                buttonStates[text] = false
            end

            local function update()

                if buttonStates[text] then

                    button.Text =
                        text.." [ON]"

                    if redToggleButtons[text] then

                        button.BackgroundColor3 =
                            Color3.fromRGB(
                                120,0,0
                            )

                    else

                        button.BackgroundColor3 =
                            Color3.fromRGB(
                                0,120,0
                            )

                    end

                else

                    button.Text =
                        text.." [OFF]"

                    button.BackgroundColor3 =
                        Color3.fromRGB(
                            20,20,20
                        )

                end

                button.TextColor3 =
                    rightButtonTextColors[text]
                    or Color3.fromRGB(
                        255,255,255
                    )

            end

            update()

            button.MouseButton1Click:Connect(function()

                buttonStates[text] =
                    not buttonStates[text]

                update()

                if callback then
                    callback(
                        buttonStates[text]
                    )
                end

            end)

        else

            button.MouseButton1Click:Connect(function()

                if not noGreenFlash[text] then

                    local oldColor =
                        button.BackgroundColor3

                    button.BackgroundColor3 =
                        Color3.fromRGB(
                            0,120,0
                        )

                    task.delay(
                        0.4,
                        function()

                            if button then

                                button.BackgroundColor3 =
                                    oldColor

                            end

                        end
                    )

                end

                if callback then
                    callback()
                end

            end)

        end

    end

end

--==================================================
-- MENÚ
--==================================================

local menuOrder = {

    "MAIN",
    "ESP",
    "COMBATE",
    "AUTO",
    "TELEPORT",
    "LABELS",
    "FPS",
}

local menuData = {

    ["MAIN"] = {

        "INVISIBLE",
        "DESYNC",
        "OBTENER SHIFTLOCK",
        "SPEED",
        "JUMPPOWER",
        "GRAVITY",
        "RESET STATS",
        "INFINITI JUMP",
        "NOCLIP",
        "FLY SPEED",
        "FLY",

    },

    ["ESP"] = {

        "ESP ULTI",

    },

    ["AUTO"] = {

        "AUTO RECOGER OBJETOS",
        "AUTO ABRIR PUERTAS",

    },

    ["COMBATE"] = {

        "AUTO WALLCOMBO",
        "CONTRATAQUE AUTOMÁTICO A M1",
        "DISTANCIA DE LA DETECCIÓN DE M1",
        "BLOQUEO AUTOMÁTICO A M1",
        "DISTANCIA DE LA DETECCIÓN DEL M1",

    },

    ["TELEPORT"] = {

        "TP TOOL",
        "NOMBRE DE EL JUGADOR",
        "TP A JUGADOR",

    },

    ["LABELS"] = {

        "CONTADOR DE PING",
        "CONTADOR DE FPS",

    },

    ["FPS"] = {

        "Fps Boost",

    },

}

--==================================================
-- LIMPIAR DERECHO
--==================================================

local function clearFrame(frame)

    for _,v in ipairs(frame:GetChildren()) do

        if v:IsA("GuiObject")
        and not v:IsA("UIPadding") then

            v:Destroy()

        end

    end

end

--==================================================
-- CREAR MENÚS
--==================================================

for i,menu in ipairs(menuOrder) do

    createMenuButton(
        leftFrame,
        menu,
        10 + ((i-1)*35),
        function()

            clearFrame(rightFrame)

            local titleLabel =
                Instance.new(
                    "TextLabel",
                    rightFrame
                )

            titleLabel.Size =
                UDim2.new(1,0,0,30)

            titleLabel.Position =
                UDim2.new(0,0,0,5)

            titleLabel.BackgroundTransparency = 1

            titleLabel.Text =
                menuNames[menu] or menu

            titleLabel.TextColor3 =
                menuTitleColors[menu]
                or Color3.fromRGB(
                    255,255,255
                )

            titleLabel.Font =
                Enum.Font.GothamBold

            titleLabel.TextSize = 18

            titleLabel.TextXAlignment =
                Enum.TextXAlignment.Center

            local oy = 40

            for _,opt in ipairs(
                menuData[menu] or {}
            ) do

                --==================================================
                -- TITULO
                --==================================================

                if buttonTitles[opt] then

                    local section =
                        Instance.new(
                            "TextLabel",
                            rightFrame
                        )

                    section.Size =
                        UDim2.new(
                            1,-20,
                            0,25
                        )

                    section.Position =
                        UDim2.new(
                            0,10,
                            0,oy
                        )

                    section.BackgroundTransparency = 1

                    section.Text =
                        buttonTitles[opt]

                    section.TextColor3 =
                        Color3.fromRGB(
                            200,200,200
                        )

                    section.Font =
                        Enum.Font.GothamBold

                    section.TextSize = 14

                    section.TextXAlignment =
                        Enum.TextXAlignment.Left

                    oy += 28

                end

                --==================================================
                -- TITULO SUPERIOR
                --==================================================

                if topTitles[opt] then

                    local section =
                        Instance.new(
                            "TextLabel",
                            rightFrame
                        )

                    section.Size =
                        UDim2.new(
                            1,-20,
                            0,25
                        )

                    section.Position =
                        UDim2.new(
                            0,10,
                            0,oy
                        )

                    section.BackgroundTransparency = 1

                    section.Text =
                        topTitles[opt]

                    section.TextColor3 =
                        Color3.fromRGB(
                            255,255,255
                        )

                    section.Font =
                        Enum.Font.GothamBold

                    section.TextSize = 16

                    section.TextXAlignment =
                        Enum.TextXAlignment.Left

                    oy += 28

                end

                --==================================================
                -- BOTÓN
                --==================================================

                createButton(
                    rightFrame,
                    opt,
                    oy,
                    function(state)

                        if opt ==
                            "RESET STATS" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Reset-speed-jumpPower-y-gravedad-/refs/heads/main/Reset.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "AUTO WALLCOMBO" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text233/refs/heads/main/Text233.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "GODMODE" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text497/refs/heads/main/Text497.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "CONTRATAQUE AUTOMÁTICO A M1" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text502/refs/heads/main/Text502.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "ESP ULTI" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text503/refs/heads/main/Text503.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "CONTADOR DE PING" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Detector_ping/refs/heads/main/Ping.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "CONTADOR DE FPS" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Detectar_fps/refs/heads/main/Fps.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "BLOQUEO AUTOMÁTICO A M1" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text241/refs/heads/main/Text241.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "MAS ESPACIO PARA EMOTES" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text504/refs/heads/main/Text504.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "AUTO MATAR A TODOS" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text468/refs/heads/main/Text468.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "DESYNC" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text428/refs/heads/main/Text428.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "AUTO MATAR" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text469/refs/heads/main/Text469.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "LAG SERVER (EQUIPAR BOMBA)" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text470/refs/heads/main/Text470.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "ESTAR EN LA ETAPA 99.900M" then

                            getgenv().StageNumber =
                                99999000000

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text66/refs/heads/main/Text66.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "PARAR EL TIEMPO" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text471/refs/heads/main/Text471.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "SER GUARDIA" then

                            getgenv().StageNumber = 21

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text66/refs/heads/main/Text66.lua"
                                    )
                                )()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text67/refs/heads/main/Text67.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "SER PRISIONERO" then

                            getgenv().StageNumber = 1

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Reset_Player/refs/heads/main/Reset.lua"
                                    )
                                )()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text66/refs/heads/main/Text66.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "ESP A JUGADORES" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text473/refs/heads/main/Text473.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "ESP A BARRY" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text474/refs/heads/main/Text474.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "AUTO ARRESTAR" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text56/refs/heads/main/Text56.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "SER FUERTE" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text475/refs/heads/main/Text475.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "COCINAR GENTE (BOTON)" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text476/refs/heads/main/Text476.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "OBTENER SHIFTLOCK" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Shift-lock/refs/heads/main/Shift_Lock_.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "FLING PLAYER" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text156/refs/heads/main/Text156.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "QUITAR LAS PAREDES INVISIBLES" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text365/refs/heads/main/Text365.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "AIMBOT TOTAL" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text93/refs/heads/main/Text93.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "X-RAY" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text147/refs/heads/main/Text147.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "TP TO PLAYER" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text408/refs/heads/main/Text408.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "AIMBOT LIGERO" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text422/refs/heads/main/Text422.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "FLY" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Fly/refs/heads/main/Fly.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "INFINITI JUMP" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/INFINITI-JUMP/refs/heads/main/Salto%20infinito.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "SHOOT THE MURDERER" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text314/refs/heads/main/Text314.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "LOCALPLAYER" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text8/refs/heads/main/Text8.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "NOCLIP" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/NOCLIP/refs/heads/main/NOCLIP.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "ESP PANELS" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text211/refs/heads/main/Text211.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "Fps Boost" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Fps-Boost-/refs/heads/main/FPS_BOOST_UNIVERSAL.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "INVISIBLE" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text427/refs/heads/main/Text427.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "TOUCH FLING" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text281/refs/heads/main/Text281.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "YOUTUBE:SBS HUB" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Copiar-canal/refs/heads/main/Suscribete.lua"
                                    )
                                )()

                            end)

                        elseif opt ==
                            "TP TOOL" then

                            pcall(function()

                                loadstring(
                                    game:HttpGet(
                                        "https://raw.githubusercontent.com/davidsebas348-hub/Text331/refs/heads/main/Text331.lua"
                                    )
                                )()

                            end)

                        end

                    end
                )

                --==================================================
                -- DESCRIPCIÓN
                --==================================================

                local descriptionText =
                    buttonDescriptions[opt]

                local buttonHeight = 30

                if descriptionText then

                    local descriptionHeight =
                        getDescriptionHeight(
                            descriptionText
                        )

                    local description =
                        Instance.new(
                            "TextLabel",
                            rightFrame
                        )

                    description.Size =
                        UDim2.new(
                            1,-30,
                            0,descriptionHeight
                        )

                    description.Position =
                        UDim2.new(
                            0,15,
                            0,
                            oy + 33
                        )

                    description.BackgroundTransparency = 1

                    description.Text =
                        descriptionText

                    description.TextColor3 =
                        Color3.fromRGB(
                            135,135,135
                        )

                    description.Font =
                        Enum.Font.Gotham

                    description.TextSize = 10

                    description.TextWrapped = true

                    description.TextXAlignment =
                        Enum.TextXAlignment.Left

                    description.TextYAlignment =
                        Enum.TextYAlignment.Top

                    buttonHeight +=
                        descriptionHeight + 8

                end

                --==================================================
                -- ESPACIO AUTOMÁTICO
                --==================================================

                oy +=
                    buttonHeight + 8

                --==================================================
                -- TITULO PERSONALIZADO
                --==================================================

                if customTitles[opt] then

                    local section =
                        Instance.new(
                            "TextLabel",
                            rightFrame
                        )

                    section.Size =
                        UDim2.new(
                            1,-20,
                            0,25
                        )

                    section.Position =
                        UDim2.new(
                            0,10,
                            0,oy
                        )

                    section.BackgroundTransparency = 1

                    section.Text =
                        customTitles[opt]

                    section.TextColor3 =
                        Color3.fromRGB(
                            255,255,255
                        )

                    section.Font =
                        Enum.Font.GothamBold

                    section.TextSize = 15

                    section.TextXAlignment =
                        Enum.TextXAlignment.Center

                    oy += 30

                end

            end

        end
    )

end

--==================================================
-- BOTÓN SBS
--==================================================

local toggle =
    Instance.new(
        "TextButton",
        screenGui
    )

toggle.Size =
    UDim2.new(0,60,0,60)

toggle.Position =
    UDim2.new(1,-80,0,20)

toggle.BackgroundColor3 =
    Color3.fromRGB(20,20,20)

toggle.Text =
    "SBS"

toggle.TextColor3 =
    Color3.fromRGB(255,255,255)

toggle.Font =
    Enum.Font.GothamBold

toggle.TextSize = 24

toggle.BorderSizePixel = 0

local corner =
    Instance.new(
        "UICorner",
        toggle
    )

corner.CornerRadius =
    UDim.new(0.3,0)

--==================================================
-- DRAG SBS
--==================================================

do

    local dragging = false
    local dragStart
    local startPos
    local dragInput

    local function update(input)

        local delta =
            input.Position - dragStart

        toggle.Position =
            UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )

    end

    toggle.InputBegan:Connect(function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseButton1
        or input.UserInputType ==
            Enum.UserInputType.Touch then

            dragging = true

            dragStart =
                input.Position

            startPos =
                toggle.Position

            input.Changed:Connect(function()

                if input.UserInputState ==
                    Enum.UserInputState.End then

                    dragging = false

                end

            end)

        end

    end)

    toggle.InputChanged:Connect(function(input)

        if input.UserInputType ==
            Enum.UserInputType.MouseMovement
        or input.UserInputType ==
            Enum.UserInputType.Touch then

            dragInput = input

        end

    end)

    UserInputService.InputChanged:Connect(function(input)

        if input == dragInput
        and dragging then

            update(input)

        end

    end)

end

--==================================================
-- ABRIR / CERRAR
--==================================================

local open = true

toggle.MouseButton1Click:Connect(function()

    open = not open

    mainFrame.Visible = open

end)
