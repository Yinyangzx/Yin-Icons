--[[
    ════════════════════════════════════════════════════════════════
    YIN YANG - CATÁLOGO DE ICONOS FLOTANTES
    ════════════════════════════════════════════════════════════════
    Este archivo se descarga desde GitHub (raw) al iniciar la librería.
    Sirve para poblar la pestaña "Logo", donde el usuario elige qué
    ícono flotante (el botón redondo que aparece al minimizar) usar.

    ────────────────────────────────────────────────────────────────
    CAPAS (Layers) — hasta 3 imágenes por ícono, cada una con su
    propio movimiento. Ninguna es obligatoria salvo la primera.
    ────────────────────────────────────────────────────────────────

    Cada capa admite:
        Image     = "rbxassetid://..."   (obligatorio)
        Movement  = "Spin" | "Pulse" | "Orbit" | "Float" | "Shake" | "Fade" | "None"
                    (opcional, default "None" = no se mueve)
        Speed     = número (opcional, significado según Movement — ver tabla)
        Amount    = número (opcional, significado según Movement — ver tabla)
        Direction = 1 o -1 (opcional, solo Spin/Orbit, default 1)
        Style     = "Organic" | "Constant" (opcional, solo Spin, default "Organic")

    Qué significan Speed y Amount en cada Movement:

        Spin    Speed  = velocidad de rotación en °/segundo (default 60)
                Amount  = (no se usa)
        Pulse   Speed  = duración de un latido completo en segundos (default 1.2)
                Amount  = cuánto crece/encoge en % (default 12, o sea 88%-112%)
        Orbit   Speed  = velocidad orbital en °/segundo (default 40)
                Amount  = radio de la órbita en píxeles (default 6)
        Float   Speed  = duración de un ciclo sube-baja en segundos (default 2)
                Amount  = distancia que sube/baja en píxeles (default 4)
        Shake   Speed  = qué tan rápido tiembla, vibraciones/segundo (default 12)
                Amount  = intensidad del temblor en píxeles (default 2)
        Fade    Speed  = duración de un ciclo aparece-desaparece en segundos (default 1.5)
                Amount  = transparencia máxima que alcanza, 0-1 (default 0.6)

    ────────────────────────────────────────────────────────────────
    SONIDOS — ambos opcionales, independientes entre sí
    ────────────────────────────────────────────────────────────────

    IdleSound  = suena en loop mientras el ícono está flotando (ventana cerrada)
        Id       = "rbxassetid://..."
        Interval = segundos entre cada reproducción (ej: 15)
        Volume   = 0.0 a 1.0

    ClickSound = suena SOLO este ícono al tocarlo para abrir la librería
        Id       = "rbxassetid://..."
        Volume   = 0.0 a 1.0

    ────────────────────────────────────────────────────────────────
    CÓMO AGREGAR UN ÍCONO NUEVO
    ────────────────────────────────────────────────────────────────
      1. Subí las imágenes que quieras usar (1 a 3) a Roblox como decals
      2. Copiá los rbxassetid:// de cada una
      3. Agregá una entrada nueva en Icons{} copiando la plantilla de abajo
      4. Agregá su nombre en Order{} donde quieras que aparezca en la lista
      5. (Opcional) Sonidos: subí el audio a Roblox y agregá IdleSound/ClickSound
    ════════════════════════════════════════════════════════════════
]]

return {
    Version = 1,

    --// Orden en el que aparecen en la pestaña Logo
    Order = {
        "ClassicYinYang",
        "YinYangPink",
        "DraconicStyle",
        "DraconicStyleVariant",
        "Old",
    },

    Icons = {
        --// ✅ VERIFICADO: es el ícono flotante actual de la librería
        --// (2 capas: logo base fijo + anillo que gira encima)
        ClassicYinYang = {
            LabelES = "Yin Yang Clásico",
            LabelEN = "Classic Yin Yang",

            Layers = {
                { Image = "rbxassetid://106130066496682", Movement = "None" },
                { Image = "rbxassetid://70721341917757",  Movement = "Spin", Speed = 60, Direction = 1, Style = "Organic" },
            },

            IdleSound = {
                Id       = "", -- (poné acá el rbxassetid:// del sonido de dragón si querés que este ícono lo traiga)
                Interval = 15,
                Volume   = 0.15,
            },

            -- ClickSound no está seteado acá a propósito:
            -- si se deja nil, usa el sonido de click genérico de la UI (comportamiento actual)
        },

        --// 🧪 PRUEBA: mismo efecto que ClassicYinYang (capa base fija + anillo que gira
        --// encima), solo cambia la imagen — de blanco/negro a blanco/rosa.
        YinYangPink = {
            LabelES = "Yin Yang Pink",
            LabelEN = "Yin Yang Pink",

            Layers = {
                { Image = "rbxassetid://92154292599420",  Movement = "None" },
                { Image = "rbxassetid://101112636011105", Movement = "Spin", Speed = 60, Direction = 1, Style = "Organic" },
            },

            -- Sin IdleSound/ClickSound propios: usa el genérico de la UI (mismo
            -- comportamiento que ClassicYinYang cuando no se define ninguno).
        },

        DraconicStyle = {
            LabelES = "Estilo Draconico",
            LabelEN = "Draconic Style",

            Layers = {
                -- Capa 1: icono central quieto (mas pequeño para no tapar los dragones)
                { Image = "rbxassetid://121924081188757", Movement = "None", Scale = 1.2 },
                -- Capa 2: dragones girando bien grandes alrededor
                { Image = "rbxassetid://95047780876541", Movement = "Spin", Speed = 75, Direction = 1, Style = "Organic", Scale = 2.6 },
            },

            ClickSound = { Id = "rbxassetid://122225901664901", Volume = 0.60 },

            --// Ojos parpadeantes blancos superpuestos al icono quieto
            --// X1/Y1 = ojo izquierdo, X2/Y2 = ojo derecho (0..1 relativo al ToggleButton)
            --// Si no quedan bien, ajusta X1/X2/Y1/Y2 en pasos de 0.05
            Eyes = {
                X1   = 0.32,  -- ojo izquierdo (mas a la izquierda)
                Y1   = 0.47,  -- centro vertical
                X2   = 0.68,  -- ojo derecho (mas a la derecha)
                Y2   = 0.47,
                Size = 0.09,  -- mas pequeños
                Color = Color3.fromRGB(255, 0, 0),  -- ojos rojos (antes blanco)
            },
        },

        --// Variante: misma composición que DraconicStyle; solo cambian assets y etiqueta.
        DraconicStyleVariant = {
            LabelES = "Estilo Dracónico II",
            LabelEN = "Draconic Style II",

            Layers = {
                -- Capa central fija, idéntica en escala al icono de referencia.
                { Image = "rbxassetid://130509724933587", Movement = "None", Scale = 1.2 },
                -- Dragones en giro orgánico, con la misma escala, velocidad y dirección.
                { Image = "rbxassetid://133325970933941", Movement = "Spin", Speed = 75, Direction = 1, Style = "Organic", Scale = 2.6 },
            },

            ClickSound = { Id = "rbxassetid://257001341", Volume = 0.60 },

            Eyes = {
                X1    = 0.32,
                Y1    = 0.47,
                X2    = 0.68,
                Y2    = 0.47,
                Size  = 0.09,
                Image = "rbxassetid://106889903724713",  -- imagen con los 2 ojos ya dibujados
            },
        },

        --// Cápsula tipo pill — icono de 4 flechas + texto "Open YinYang"
        --// No usa Layers ni sonidos: el motor de capas se omite para este tipo.
        Old = {
            LabelES = "Open YinYang",
            LabelEN = "Open YinYang",
            Type    = "Capsule",
        },

        --// Agrega aca los proximos iconos, copiando esta plantilla:
        --[[
        NombreInterno = {
            LabelES = "Nombre en Español",
            LabelEN = "Name in English",

            Layers = {
                { Image = "rbxassetid://TU_ID_1", Movement = "Spin",  Speed = 50, Direction = 1 },
                { Image = "rbxassetid://TU_ID_2", Movement = "Pulse", Speed = 1.2, Amount = 12 },
                { Image = "rbxassetid://TU_ID_3", Movement = "Orbit", Speed = 40, Amount = 6, Direction = -1 },
            },

            IdleSound  = { Id = "rbxassetid://TU_SONIDO_IDLE",  Interval = 15, Volume = 0.15 },
            ClickSound = { Id = "rbxassetid://TU_SONIDO_CLICK", Volume = 0.6 },
        },
        ]]
    },
}
