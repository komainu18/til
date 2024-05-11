package jp.komainu.ya.postfromswitch

import android.content.Intent
import android.os.Bundle
import android.webkit.WebView
import android.webkit.WebViewClient
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.viewinterop.AndroidView
import jp.komainu.ya.postfromswitch.ui.theme.PostFromSwitchTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val action = intent.action
        val extra = intent.extras
        val url = if (action == Intent.ACTION_VIEW) {
            intent.toUri(0)
        } else {
            "https://google.com/"
        }

        setContent {
            PostFromSwitchTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    Greeting(url)
                }
            }
        }
    }
}

@Composable
fun Greeting(url: String) {
    // 表示したいページのurlを指定
    AndroidView(
        modifier = Modifier.fillMaxSize(),
        factory = {
            WebView(it).apply {
                webViewClient = WebViewClient()
                loadUrl(url)
            }
        }
    )
}

@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    PostFromSwitchTheme {
        Greeting("https://google.com/")
    }
}