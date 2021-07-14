package wannabit.io.cosmostaion.widget.txDetail.gravity;

import android.content.Context;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;

import cosmos.tx.v1beta1.ServiceOuterClass;
import tendermint.liquidity.v1beta1.Tx;
import wannabit.io.cosmostaion.R;
import wannabit.io.cosmostaion.base.BaseChain;
import wannabit.io.cosmostaion.base.BaseData;
import wannabit.io.cosmostaion.model.type.Coin;
import wannabit.io.cosmostaion.utils.WDp;
import wannabit.io.cosmostaion.widget.txDetail.TxHolder;

public class TxGravityWithdrawHolder extends TxHolder {
    ImageView itemGravityWithdrawImg;
    TextView itemGravityWithdrawAddress, itemGravityWithdrawId,
            itemGravityWithdrawAmount, itemGravityWithdrawSymbol;

    public TxGravityWithdrawHolder(@NonNull View itemView) {
        super(itemView);
        itemGravityWithdrawImg = itemView.findViewById(R.id.tx_gravity_deposit_batch_icon);
        itemGravityWithdrawAddress = itemView.findViewById(R.id.tx_gravity_deposit_batch_address);
        itemGravityWithdrawId = itemView.findViewById(R.id.tx_gravity_deposit_batch_id);
        itemGravityWithdrawAmount= itemView.findViewById(R.id.tx_gravity_withdraw_coin_amount);
        itemGravityWithdrawSymbol = itemView.findViewById(R.id.tx_gravity_withdraw_coin_symbol);
    }

    public void onBindMsg(Context c, BaseData baseData, BaseChain baseChain, ServiceOuterClass.GetTxResponse response, int position, String address, boolean isGen) {
        itemGravityWithdrawImg.setColorFilter(WDp.getChainColor(c, baseChain), android.graphics.PorterDuff.Mode.SRC_IN);

        try {
            Tx.MsgWithdrawWithinBatch msg = Tx.MsgWithdrawWithinBatch.parseFrom(response.getTx().getBody().getMessages(position).getValue());
            itemGravityWithdrawAddress.setText(msg.getWithdrawerAddress());
            itemGravityWithdrawId.setText("" + msg.getPoolId());

            Coin coin0 = new Coin(msg.getPoolCoin().getDenom(), msg.getPoolCoin().getAmount());

            WDp.showCoinDp(c, coin0, itemGravityWithdrawSymbol, itemGravityWithdrawAmount, baseChain);

        } catch (Exception e) { }
    }
}