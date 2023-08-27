project "GLFW"
    kind "staticLib"
    language "C"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

-- Multiplatform files
    files {
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "src/internal.h",
        "src/platform.h",
        "src/mappings.h",
        "src/null_platform.h",
        "src/null_joystick.h",
        "src/context.c",
        "src/vulkan.c",
        "src/platform.c",
        "src/monitor.c",
        "src/window.c",
        "src/egl_context.c",
        "src/osmesa_context.c",
        "src/init.c",
        "src/null_init.c",
        "src/input.c",
    
        "src/null_monitor.c",
        "src/null_window.c",
        "src/null_joystick.c",
    }

    filter "system:windows"
        systemversion "latest"
        staticruntime "on"
    -- Windows OS specific files
        files {
            "src/win32_joystick.h",
            "src/win32_platform.h",
            "src/win32_thread.h",
            "src/win32_time.h",
            "src/win32_init.c",
            "src/win32_joystick.c",
            "src/win32_module.c",
            "src/win32_monitor.c",
            "src/win32_thread.c",
            "src/win32_time.c",
            "src/win32_window.c",
            "src/wgl_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c"
        }

        defines {
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS"
        }
    
    filter "system:linux"
        pic "on"

        systemversion "latest"
    
        files {
            "src/x11_init.c",
            "src/x11_monitor.c",
            "src/x11_window.c",
            "src/xkb_unicode.c",
            "src/posix_module.c",
            "src/posix_time.c",
            "src/posix_thread.c",
            "src/glx_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c",
            "src/linux_joystick.c"
        }
        defines {
            "_GLFW_X11"
        }

    filter "system:macosx"
        pic "on"

        files {
            "src/cocoa_init.m",
            "src/cocoa_monitor.m",
            "src/cocoa_window.m",
            "src/cocoa_joystick.m",
            "src/cocoa_time.c",
            "src/nsgl_context.m",
            "src/posix_thread.c",
            "src/posix_module.c",
            "src/osmesa_context.c",
            "src/egl_context.c"
        }

        defines {
            "_GLFW_COCOA"
        }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"