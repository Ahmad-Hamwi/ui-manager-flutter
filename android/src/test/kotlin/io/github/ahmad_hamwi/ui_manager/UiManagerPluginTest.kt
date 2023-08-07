package io.github.ahmad_hamwi.ui_manager

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import org.mockito.Mockito.mock
import org.mockito.Mockito.verify
import kotlin.test.Test

/*
 * This demonstrates a simple unit test of the Kotlin portion of this plugin's implementation.
 *
 * Once you have built the plugin's example app, you can run these tests from the command
 * line by running `./gradlew testDebugUnitTest` in the `example/android/` directory, or
 * you can run them directly from IDEs that support JUnit such as Android Studio.
 */

internal class UiManagerPluginTest {
    @Test
    fun onMethodCall_minimize_returns() {
        val sut = UiManagerPlugin()
        val call = MethodCall("minimize", null)
        val mockResult: MethodChannel.Result = mock()

        sut.onMethodCall(call, mockResult)

        verify(mockResult).success(null)
    }
}
