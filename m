Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 22A37273766
	for <lists+dm-devel@lfdr.de>; Tue, 22 Sep 2020 02:28:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-WcVil5X_Mku1TvZ3QuzbXA-1; Mon, 21 Sep 2020 20:28:17 -0400
X-MC-Unique: WcVil5X_Mku1TvZ3QuzbXA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51F42425D7;
	Tue, 22 Sep 2020 00:28:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A4B960BF4;
	Tue, 22 Sep 2020 00:28:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B23A344A7F;
	Tue, 22 Sep 2020 00:27:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08M0RYo1003798 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 20:27:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3BE7E114B2EC; Tue, 22 Sep 2020 00:27:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36AC3114B2EB
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 00:27:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E290900C60
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 00:27:31 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-583-V4Fpwhm5P-Ox-XSkDzyv-Q-1;
	Mon, 21 Sep 2020 20:27:28 -0400
X-MC-Unique: V4Fpwhm5P-Ox-XSkDzyv-Q-1
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
	[172.10.235.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3464A23A79;
	Tue, 22 Sep 2020 00:27:27 +0000 (UTC)
Date: Mon, 21 Sep 2020 17:27:25 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200922002725.GB32959@sol.localdomain>
References: <20200909234422.76194-1-satyat@google.com>
	<20200909234422.76194-2-satyat@google.com>
MIME-Version: 1.0
In-Reply-To: <20200909234422.76194-2-satyat@google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/3] block: keyslot-manager: Introduce
 passthrough keyslot manager
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 09, 2020 at 11:44:20PM +0000, Satya Tangirala wrote:
> The device mapper may map over devices that have inline encryption
> capabilities, and to make use of those capabilities, the DM device must
> itself advertise those inline encryption capabilities. One way to do this
> would be to have the DM device set up a keyslot manager with a
> "sufficiently large" number of keyslots, but that would use a lot of
> memory. Also, the DM device itself has no "keyslots", and it doesn't make
> much sense to talk about "programming a key into a DM device's keyslot
> manager", so all that extra memory used to represent those keyslots is just
> wasted. All a DM device really needs to be able to do is advertise the
> crypto capabilities of the underlying devices in a coherent manner and
> expose a way to evict keys from the underlying devices.
> 
> There are also devices with inline encryption hardware that do not
> have a limited number of keyslots. One can send a raw encryption key along
> with a bio to these devices (as opposed to typical inline encryption
> hardware that require users to first program a raw encryption key into a
> keyslot, and send the index of that keyslot along with the bio). These
> devices also only need the same things from the keyslot manager that DM
> devices need - a way to advertise crypto capabilities and potentially a way
> to expose a function to evict keys from hardware.

To be a bit more concrete, FMP (Flash Memory Protector) on Exynos SoCs is an
example of hardware that supports inline encryption without having the concept
of keyslots.  On that hardware, each request takes an actual key, rather than a
keyslot number.  Likewise, some Mediatek SoCs are like this too.

So support for inline encryption without keyslots is something that is useful
for real hardware, in addition to the device-mapper support which is the initial
use case included in this patchset.

> So we introduce a "passthrough" keyslot manager that provides a way to
> represent a keyslot manager that doesn't have just a limited number of
> keyslots, and for which do not require keys to be programmed into keyslots.
> DM devices can set up a passthrough keyslot manager in their request
> queues, and advertise appropriate crypto capabilities based on those of the
> underlying devices. Blk-crypto does not attempt to program keys into any
> keyslots in the passthrough keyslot manager. Instead, if/when the bio is
> resubmitted to the underlying device, blk-crypto will try to program the
> key into the underlying device's keyslot manager.
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>

Generally looks good, feel free to add:

	Reviewed-by: Eric Biggers <ebiggers@google.com>

However, maybe it's worth reconsidering the suggestion I've made previously
(https://lkml.kernel.org/linux-block/20200326062213.GF858@sol.localdomain) of
separating the crypto capabilities from the keyslot manager.  If we did that,
then this case could be handled by a NULL keyslot manager, rather than a special
kind of keyslot manager that doesn't actually do the keyslot management.

I realize that it's a bit tricky because the key eviction callback would still
be needed.  So maybe it's not really better.  Also, previously other people have
seemed to prefer just the keyslot manager, e.g.
https://lkml.kernel.org/linux-block/20200327170047.GA24682@infradead.org.

Does anyone have any new thoughts on this?

Also, a couple minor comments below.

> @@ -353,6 +372,9 @@ void blk_ksm_reprogram_all_keys(struct blk_keyslot_manager *ksm)
>  {
>  	unsigned int slot;
>  
> +	if (WARN_ON(blk_ksm_is_passthrough(ksm)))
> +		return;
> +

I think the above WARN_ON() should just be removed:

	if (blk_ksm_is_passthrough(ksm))
		return;

Otherwise callers might need to conditionally call blk_ksm_reprogram_all_keys()
depending on whether there are keyslots or not.

> +/**
> + * blk_ksm_init_passthrough() - Init a passthrough keyslot manager
> + * @ksm: The keyslot manager to init
> + *
> + * Initialize a passthrough keyslot manager.
> + * Called by e.g. storage drivers to set up a keyslot manager in their
> + * request_queue, when the storage driver wants to manage its keys by itself.
> + * This is useful for inline encryption hardware that don't have a small fixed
> + * number of keyslots, and for layered devices.
> + *

Maybe:

"inline encryption hardware that don't have a small fixed number of keyslots"

=>

"inline encryption hardware that doesn't have the concept of keyslots"

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

