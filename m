Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1459C263F4D
	for <lists+dm-devel@lfdr.de>; Thu, 10 Sep 2020 10:07:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-GRUWD-BZPzqiXv3NjpLTvA-1; Thu, 10 Sep 2020 04:07:18 -0400
X-MC-Unique: GRUWD-BZPzqiXv3NjpLTvA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8AFE801AF8;
	Thu, 10 Sep 2020 08:07:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 784741002D59;
	Thu, 10 Sep 2020 08:07:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 350D3922EE;
	Thu, 10 Sep 2020 08:07:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 089NibiA011494 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 9 Sep 2020 19:44:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0968EF1C8C; Wed,  9 Sep 2020 23:44:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04B51F1C6E
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 23:44:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA03780121C
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 23:44:34 +0000 (UTC)
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com
	[209.85.215.202]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-385-dUrp-fuyODC_OzJY0pEIpg-1; Wed, 09 Sep 2020 19:44:32 -0400
X-MC-Unique: dUrp-fuyODC_OzJY0pEIpg-1
Received: by mail-pg1-f202.google.com with SMTP id o5so2830195pgm.19
	for <dm-devel@redhat.com>; Wed, 09 Sep 2020 16:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
	:references:subject:from:to:cc;
	bh=ebS6PiGWixaTBhYeaEc/zhiWarm78MJMQVZ5bZI+E3I=;
	b=Fv8ITIMlpBD6Fh9DRLioebk85KQL1tioK3VNbw+bmyQepA+i22+D24uwQiCzhfaO9i
	3fOQlfA17qkpPnq83b0cwTFO9htI1AZAwq8mCOwnjbZCvkbXRUWdN+VsTS2leqdOrIcx
	vDwiS/4lWfNSREKGDLF8Ahi5SCn4Fpcbr75ubNO8sVgq9HoSiz/rYYT4z2WwgIwvI0lZ
	HKdhs2Halv3mOPDr3rJsR4FW4kg0jcwkNhCC1w8zQcvczUBCDd9V9+r5wEwnlcPIuj6Z
	Yhqpr8GO0Sxy3gdZx59Ffr8ZOF+abR0SH2Uhrphs2FvGBwAU+lZAhuKSjxv3OT8ReRhu
	FLAA==
X-Gm-Message-State: AOAM533tVNdCCuSjiFHwT2qNG64BUuqT3HX1nAl83w/B+9N7U912q/kR
	o+25RN4Y0xrMZCQS/o262zuaFU8/1eE=
X-Google-Smtp-Source: ABdhPJyvq63o4Wpeo+ZPZJ2bBhb/p13PzGAtNwmcUOtqEpVa/QtHf09RXOxv8op6je00ssBQbZ5Cej9m9nQ=
X-Received: from satyaprateek.c.googlers.com
	([fda3:e722:ac3:10:24:72f4:c0a8:2d8e])
	(user=satyat job=sendgmr) by 2002:a17:90b:15c6:: with SMTP id
	lh6mr245816pjb.0.1599695070812; Wed, 09 Sep 2020 16:44:30 -0700 (PDT)
Date: Wed,  9 Sep 2020 23:44:20 +0000
In-Reply-To: <20200909234422.76194-1-satyat@google.com>
Message-Id: <20200909234422.76194-2-satyat@google.com>
Mime-Version: 1.0
References: <20200909234422.76194-1-satyat@google.com>
From: Satya Tangirala <satyat@google.com>
To: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	dm-devel@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 10 Sep 2020 04:06:55 -0400
Cc: Jens Axboe <axboe@kernel.dk>, Satya Tangirala <satyat@google.com>,
	Mike Snitzer <snitzer@redhat.com>, Alasdair Kergon <agk@redhat.com>,
	Eric Biggers <ebiggers@google.com>
Subject: [dm-devel] [PATCH 1/3] block: keyslot-manager: Introduce
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.503
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The device mapper may map over devices that have inline encryption
capabilities, and to make use of those capabilities, the DM device must
itself advertise those inline encryption capabilities. One way to do this
would be to have the DM device set up a keyslot manager with a
"sufficiently large" number of keyslots, but that would use a lot of
memory. Also, the DM device itself has no "keyslots", and it doesn't make
much sense to talk about "programming a key into a DM device's keyslot
manager", so all that extra memory used to represent those keyslots is just
wasted. All a DM device really needs to be able to do is advertise the
crypto capabilities of the underlying devices in a coherent manner and
expose a way to evict keys from the underlying devices.

There are also devices with inline encryption hardware that do not
have a limited number of keyslots. One can send a raw encryption key along
with a bio to these devices (as opposed to typical inline encryption
hardware that require users to first program a raw encryption key into a
keyslot, and send the index of that keyslot along with the bio). These
devices also only need the same things from the keyslot manager that DM
devices need - a way to advertise crypto capabilities and potentially a way
to expose a function to evict keys from hardware.

So we introduce a "passthrough" keyslot manager that provides a way to
represent a keyslot manager that doesn't have just a limited number of
keyslots, and for which do not require keys to be programmed into keyslots.
DM devices can set up a passthrough keyslot manager in their request
queues, and advertise appropriate crypto capabilities based on those of the
underlying devices. Blk-crypto does not attempt to program keys into any
keyslots in the passthrough keyslot manager. Instead, if/when the bio is
resubmitted to the underlying device, blk-crypto will try to program the
key into the underlying device's keyslot manager.

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 block/keyslot-manager.c         | 41 +++++++++++++++++++++++++++++++++
 include/linux/keyslot-manager.h |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/block/keyslot-manager.c b/block/keyslot-manager.c
index 35abcb1ec051..60ac406d54b9 100644
--- a/block/keyslot-manager.c
+++ b/block/keyslot-manager.c
@@ -62,6 +62,11 @@ static inline void blk_ksm_hw_exit(struct blk_keyslot_manager *ksm)
 		pm_runtime_put_sync(ksm->dev);
 }
 
+static inline bool blk_ksm_is_passthrough(struct blk_keyslot_manager *ksm)
+{
+	return ksm->num_slots == 0;
+}
+
 /**
  * blk_ksm_init() - Initialize a keyslot manager
  * @ksm: The keyslot_manager to initialize.
@@ -198,6 +203,10 @@ blk_status_t blk_ksm_get_slot_for_key(struct blk_keyslot_manager *ksm,
 	int err;
 
 	*slot_ptr = NULL;
+
+	if (blk_ksm_is_passthrough(ksm))
+		return BLK_STS_OK;
+
 	down_read(&ksm->lock);
 	slot = blk_ksm_find_and_grab_keyslot(ksm, key);
 	up_read(&ksm->lock);
@@ -318,6 +327,16 @@ int blk_ksm_evict_key(struct blk_keyslot_manager *ksm,
 	struct blk_ksm_keyslot *slot;
 	int err = 0;
 
+	if (blk_ksm_is_passthrough(ksm)) {
+		if (ksm->ksm_ll_ops.keyslot_evict) {
+			blk_ksm_hw_enter(ksm);
+			err = ksm->ksm_ll_ops.keyslot_evict(ksm, key, -1);
+			blk_ksm_hw_exit(ksm);
+			return err;
+		}
+		return 0;
+	}
+
 	blk_ksm_hw_enter(ksm);
 	slot = blk_ksm_find_keyslot(ksm, key);
 	if (!slot)
@@ -353,6 +372,9 @@ void blk_ksm_reprogram_all_keys(struct blk_keyslot_manager *ksm)
 {
 	unsigned int slot;
 
+	if (WARN_ON(blk_ksm_is_passthrough(ksm)))
+		return;
+
 	/* This is for device initialization, so don't resume the device */
 	down_write(&ksm->lock);
 	for (slot = 0; slot < ksm->num_slots; slot++) {
@@ -394,3 +416,22 @@ void blk_ksm_unregister(struct request_queue *q)
 {
 	q->ksm = NULL;
 }
+
+/**
+ * blk_ksm_init_passthrough() - Init a passthrough keyslot manager
+ * @ksm: The keyslot manager to init
+ *
+ * Initialize a passthrough keyslot manager.
+ * Called by e.g. storage drivers to set up a keyslot manager in their
+ * request_queue, when the storage driver wants to manage its keys by itself.
+ * This is useful for inline encryption hardware that don't have a small fixed
+ * number of keyslots, and for layered devices.
+ *
+ * See blk_ksm_init() for more details about the parameters.
+ */
+void blk_ksm_init_passthrough(struct blk_keyslot_manager *ksm)
+{
+	memset(ksm, 0, sizeof(*ksm));
+	init_rwsem(&ksm->lock);
+}
+EXPORT_SYMBOL_GPL(blk_ksm_init_passthrough);
diff --git a/include/linux/keyslot-manager.h b/include/linux/keyslot-manager.h
index 18f3f5346843..323e15dd6fa7 100644
--- a/include/linux/keyslot-manager.h
+++ b/include/linux/keyslot-manager.h
@@ -103,4 +103,6 @@ void blk_ksm_reprogram_all_keys(struct blk_keyslot_manager *ksm);
 
 void blk_ksm_destroy(struct blk_keyslot_manager *ksm);
 
+void blk_ksm_init_passthrough(struct blk_keyslot_manager *ksm);
+
 #endif /* __LINUX_KEYSLOT_MANAGER_H */
-- 
2.28.0.618.gf4bc123cb7-goog

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

