-- تحميل المكتبات
camera = require 'libraries/camera'
cam = camera()
anim8 = require 'libraries/anim8'

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")

    -- تحميل صورة الخلفية
    background = love.graphics.newImage('sprites/background.png')

    -- إعداد الكاميرا
    cam = camera()

    -- إعداد اللاعب
    player = {}
    player.x = 200
    player.y = 200
    player.speed = 100
    player.spriteSheet = love.graphics.newImage('sprites/char.png')
    
    -- إنشاء الجريد للأنيميشين بناءً على حجم السبرايت
    player.grid = anim8.newGrid(16, 20, 192, 160)

    -- إعداد الأنيميشين لكل اتجاه
    player.animations = {
        down  = anim8.newAnimation(player.grid('1-3', 1), 0.2),
        left  = anim8.newAnimation(player.grid('1-3', 2), 0.2),
        right = anim8.newAnimation(player.grid('1-3', 3), 0.2),
        up    = anim8.newAnimation(player.grid('1-3', 4), 0.2)
    }

    -- تحديد الأنيميشين الافتراضي
    player.anim = player.animations.down
end

function love.update(dt)
    local isMoving = false
    local moveX, moveY = 0, 0

    -- التحكم في الحركة
    if love.keyboard.isDown("d") then
        moveX = 1
        player.anim = player.animations.right
        isMoving = true
    elseif love.keyboard.isDown("a") then
        moveX = -1
        player.anim = player.animations.left
        isMoving = true
    end

    if love.keyboard.isDown("s") then
        moveY = 1
        player.anim = player.animations.down
        isMoving = true
    elseif love.keyboard.isDown("w") then
        moveY = -1
        player.anim = player.animations.up
        isMoving = true
    end

    -- تحريك اللاعب
    if isMoving then
        local magnitude = math.sqrt(moveX^2 + moveY^2)
        if magnitude > 0 then
            moveX = moveX / magnitude
            moveY = moveY / magnitude
        end
        player.x = player.x + moveX * player.speed * dt
        player.y = player.y + moveY * player.speed * dt
        player.anim:update(dt)
    else
        player.anim:gotoFrame(2) -- تثبيت اللاعب على الفريم الثاني عند الوقوف
    end

    -- تحديث موقع الكاميرا لمتابعة اللاعب
    cam:lookAt(player.x, player.y)

    -- ضبط حدود الكاميرا داخل الخريطة
    local w, h = love.graphics.getWidth(), love.graphics.getHeight()

    cam.x = math.max(w / 2, math.min(cam.x, 8000 - w / 2))  -- افتراض عرض الخريطة 8000
    cam.y = math.max(h / 2, math.min(cam.y, 6000 - h / 2))  -- افتراض ارتفاع الخريطة 6000
end

function love.draw()
    cam:attach()
        -- رسم الخلفية
        love.graphics.draw(background, 0, 0)
        
        -- رسم اللاعب
        player.anim:draw(player.spriteSheet, player.x, player.y, 0, 2, 2, 8, 10) -- مركز اللاعب
    cam:detach()
end
