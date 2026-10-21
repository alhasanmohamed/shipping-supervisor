package com.bonyanInnovation

import android.os.Build
import android.os.Bundle
import androidx.core.splashscreen.SplashScreen.Companion.installSplashScreen
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.delay
import kotlinx.coroutines.runBlocking


class MainActivity: FlutterFragmentActivity(){
    override fun onCreate(savedInstanceState: Bundle?) {
        installSplashScreen().setKeepOnScreenCondition {
            runBlocking {
                delay(500)
                false
            }
        }
        super.onCreate(savedInstanceState)
    }

    private val channel = "com.bonyan.innovation"
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler { call, result ->
            when (call.method) {
                "androidVersion" -> {
                    val version = getAndroidVersion()
                    result.success(version)
                }
                else ->{
                    result.notImplemented()
                }
            }
        }
    }

    private fun getAndroidVersion(): Int {
        return Build.VERSION.SDK_INT
    }
}

