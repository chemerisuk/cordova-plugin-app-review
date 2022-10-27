package by.chemerisuk.cordova;

import static com.google.android.gms.tasks.Tasks.await;
import static by.chemerisuk.cordova.support.ExecutionThread.WORKER;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;

import com.google.android.play.core.review.ReviewInfo;
import com.google.android.play.core.review.ReviewManager;
import com.google.android.play.core.review.ReviewManagerFactory;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaArgs;
import org.json.JSONException;

import by.chemerisuk.cordova.support.CordovaMethod;
import by.chemerisuk.cordova.support.ReflectiveCordovaPlugin;

public class AppReviewPlugin extends ReflectiveCordovaPlugin {
    @CordovaMethod(WORKER)
    private void requestReview(CallbackContext callbackContext) throws Exception {
        Activity activity = cordova.getActivity();
        ReviewManager manager = ReviewManagerFactory.create(activity);
        ReviewInfo reviewInfo = await(manager.requestReviewFlow());
        await(manager.launchReviewFlow(activity, reviewInfo));
        callbackContext.success();
    }

    @CordovaMethod
    protected void openStoreScreen(CordovaArgs args, CallbackContext callbackContext) throws JSONException {
        String packageName = args.getString(0);
        if (packageName == null) {
            packageName = cordova.getActivity().getPackageName();
        }
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("market://details?id=" + packageName));
        intent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY | Intent.FLAG_ACTIVITY_NEW_DOCUMENT | Intent.FLAG_ACTIVITY_MULTIPLE_TASK);
        cordova.getActivity().startActivity(intent);
        callbackContext.success();
    }
}
