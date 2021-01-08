package by.chemerisuk.cordova;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;

import by.chemerisuk.cordova.support.CordovaMethod;
import by.chemerisuk.cordova.support.ReflectiveCordovaPlugin;

import com.google.android.play.core.review.ReviewInfo;
import com.google.android.play.core.review.ReviewManager;
import com.google.android.play.core.review.ReviewManagerFactory;
import com.google.android.play.core.tasks.OnCompleteListener;
import com.google.android.play.core.tasks.Task;

import org.apache.cordova.CallbackContext;

public class AppReviewPlugin extends ReflectiveCordovaPlugin {
    @CordovaMethod
    private void requestReview(final CallbackContext callbackContext) {
        final Activity activity = cordova.getActivity();
        final ReviewManager manager = ReviewManagerFactory.create(activity);

        manager.requestReviewFlow().addOnCompleteListener(new OnCompleteListener<ReviewInfo>() {
            @Override
            public void onComplete(Task<ReviewInfo> task) {
                if (task.isSuccessful()) {
                    manager.launchReviewFlow(activity, task.getResult()).addOnCompleteListener(new OnCompleteListener<Void>() {
                        @Override
                        public void onComplete(Task<Void> task) {
                            if (task.isSuccessful()) {
                                callbackContext.success();
                            } else {
                                respondWith(task.getException(), callbackContext);
                            }
                        }
                    });
                } else {
                    respondWith(task.getException(), callbackContext);
                }
            }
        });
    }

    @CordovaMethod
    private void openStoreScreen(String packageName, CallbackContext callbackContext) {
        if (packageName == null) {
            packageName = cordova.getActivity().getPackageName();
        }

        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("market://details?id=" + packageName));
        intent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY | Intent.FLAG_ACTIVITY_NEW_DOCUMENT | Intent.FLAG_ACTIVITY_MULTIPLE_TASK);
        cordova.getActivity().startActivity(intent);

        callbackContext.success();
    }

    private void respondWith(Exception e, CallbackContext callbackContext) {
        callbackContext.error(e != null ? e.getMessage() : "Unknown error");
    }
}
