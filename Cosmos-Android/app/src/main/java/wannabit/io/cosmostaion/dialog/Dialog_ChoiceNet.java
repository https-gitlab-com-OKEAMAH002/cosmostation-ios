package wannabit.io.cosmostaion.dialog;

import android.app.Activity;
import android.app.Dialog;
import android.content.Intent;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v7.app.AlertDialog;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.Toast;

import wannabit.io.cosmostaion.R;
import wannabit.io.cosmostaion.base.BaseActivity;
import wannabit.io.cosmostaion.base.BaseChain;
import wannabit.io.cosmostaion.base.BaseConstant;

public class Dialog_ChoiceNet extends DialogFragment {

    private LinearLayout mMain, mIris, mBinance, mIov, mTest12k, mTest13k;

    public static Dialog_ChoiceNet newInstance(Bundle bundle) {
        Dialog_ChoiceNet frag = new Dialog_ChoiceNet();
        frag.setArguments(bundle);
        return frag;
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        getDialog().getWindow().setBackgroundDrawable(new ColorDrawable(0));
        return super.onCreateView(inflater, container, savedInstanceState);
    }

    @Override
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        View view = LayoutInflater.from(getActivity()).inflate(R.layout.dialog_choice_net, null);

        mMain = view.findViewById(R.id.main_net);
        mIris = view.findViewById(R.id.iris_net);
        mBinance = view.findViewById(R.id.binance_net);
        mIov = view.findViewById(R.id.iov_net);
        mTest12k = view.findViewById(R.id.gaia_12k);
        mTest13k = view.findViewById(R.id.gaia_13k);

        mMain.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ((BaseActivity)getActivity()).onChoiceNet(BaseChain.COSMOS_MAIN);
                getDialog().dismiss();
            }
        });

        mIris.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ((BaseActivity)getActivity()).onChoiceNet(BaseChain.IRIS_MAIN);
                getDialog().dismiss();
            }
        });

        mBinance.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ((BaseActivity)getActivity()).onChoiceNet(BaseChain.BNB_MAIN);
                getDialog().dismiss();
            }
        });

        mIov.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ((BaseActivity)getActivity()).onChoiceNet(BaseChain.IOV_MAIN);
                getDialog().dismiss();
            }
        });

        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
        builder.setView(view);
        return builder.create();
    }

}