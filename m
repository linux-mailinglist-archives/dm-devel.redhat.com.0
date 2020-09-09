Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id F24BF263F53
	for <lists+dm-devel@lfdr.de>; Thu, 10 Sep 2020 10:08:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-BLKtPdBMMHaV60rkxnX4aw-1; Thu, 10 Sep 2020 04:07:18 -0400
X-MC-Unique: BLKtPdBMMHaV60rkxnX4aw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA54C1882FC4;
	Thu, 10 Sep 2020 08:07:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C6257E8F1;
	Thu, 10 Sep 2020 08:07:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 07E47922EE;
	Thu, 10 Sep 2020 08:07:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 089NibCs011499 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 9 Sep 2020 19:44:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C3F3A2028DCC; Wed,  9 Sep 2020 23:44:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF0412017E93
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 23:44:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95172811E76
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 23:44:31 +0000 (UTC)
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com
	[209.85.219.202]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-416-c-03l8x2NkyYSIEEbji2sA-1; Wed, 09 Sep 2020 19:44:29 -0400
X-MC-Unique: c-03l8x2NkyYSIEEbji2sA-1
Received: by mail-yb1-f202.google.com with SMTP id 207so3696321ybd.13
	for <dm-devel@redhat.com>; Wed, 09 Sep 2020 16:44:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
	:to:cc;
	bh=DHwWEFMQdmnuxNjm/Olb1jwBcPoSrUeSsheT6vgRQVs=;
	b=Y4BGKDEZLY/voKzVAl/MZ9uiB6oZtr3DER/r9UA4ejVVYafavdrZa+EqStuAMPHbxQ
	l/M55tYAad6zab3BOUt0+dauyhOfD35po0lJkYgiYtM4MhmjPZKdy67quXTQSCKFO/Xd
	sZXyZix8gEzVDjLmMK/Vg+TePCNWUZnHYj0OmqrqFx45gUxrltN19rBUsiAnkrH7pweX
	X3Xj4d6fEd0Ab3h6mtSuc6Qctmti9mXjzr0NlBcOc+t5lM5Gk0+HcLnQC4wWAQNthAOe
	+TYkeKmpf1Zk39yIEMMDfcURV+IkPOUMJGf3o1xnl2nFNR1t9cLYuLLlXPJkTmc1XWm1
	NKyw==
X-Gm-Message-State: AOAM531OQ3G6j7GHlirGvnRf/8xfkmp/VQ1pEp7We+tUo8z/pviXE1Lu
	LdC3tIgBU53tZPfx3QmOlZ3LAXRomhY=
X-Google-Smtp-Source: ABdhPJy+RSLuoVD0yGW7ois0IJb5w2X4VoW/pKKhpkdaqpbInVRXxyUdRDsnmKS+pqa57cpiNKv0/QxF4z0=
X-Received: from satyaprateek.c.googlers.com
	([fda3:e722:ac3:10:24:72f4:c0a8:2d8e])
	(user=satyat job=sendgmr) by 2002:a25:81cb:: with SMTP id
	n11mr9544225ybm.490.1599695068787; 
	Wed, 09 Sep 2020 16:44:28 -0700 (PDT)
Date: Wed,  9 Sep 2020 23:44:19 +0000
Message-Id: <20200909234422.76194-1-satyat@google.com>
Mime-Version: 1.0
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 10 Sep 2020 04:06:55 -0400
Cc: Jens Axboe <axboe@kernel.dk>, Satya Tangirala <satyat@google.com>,
	Mike Snitzer <snitzer@redhat.com>, Alasdair Kergon <agk@redhat.com>,
	Eric Biggers <ebiggers@google.com>
Subject: [dm-devel] [PATCH 0/3] add support for inline encryption to device
	mapper
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.502
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch series adds support for inline encryption to the device mapper.

Patch 1 introduces the "passthrough" keyslot manager.

The regular keyslot manager is designed for inline encryption hardware that
have only a small fixed number of keyslots. A DM device itself does not
actually have only a small fixed number of keyslots - it doesn't actually
have any keyslots in the first place, and programming an encryption context
into a DM device doesn't make much semantic sense. It is possible for a DM
device to set up a keyslot manager with some "sufficiently large" number of
keyslots in its request queue, so that upper layers can use the inline
encryption capabilities of the DM device's underlying devices, but the
memory being allocated for the DM device's keyslots is a waste since they
won't actually be used by the DM device.

The passthrough keyslot manager solves this issue - when the block layer
sees that a request queue has a passthrough keyslot manager, it doesn't
attempt to program any encryption context into the keyslot manager. The
passthrough keyslot manager only allows the device to expose its inline
encryption capabilities, and a way for upper layers to evict keys if
necessary.

There also exist inline encryption hardware that can handle encryption
contexts directly, and allow users to pass them a data request along with
the encryption context (as opposed to inline encryption hardware that
require users to first program a keyslot with an encryption context, and
then require the users to pass the keyslot index with the data request).
Such devices can also make use of the passthrough keyslot manager.

Patch 2 introduces the changes for inline encryption support for the device
mapper. A DM device only exposes the intersection of the crypto
capabilities of its underlying devices. This is so that in case a bio with
an encryption context is eventually mapped to an underlying device that
doesn't support that encryption context, the blk-crypto-fallback's cipher
tfms are allocated ahead of time by the call to blk_crypto_start_using_key.

Each DM target can now also specify that it "may_passthrough_inline_crypto"
to opt-in to supporting passing through the underlying inline encryption
capabilities.  This flag is needed because it doesn't make much semantic
sense for certain targets like dm-crypt to expose the underlying inline
encryption capabilities to the upper layers. Again, the DM exposes inline
encryption capabilities of the underlying devices only if all of them
opt-in to passing through inline encryption support.

This patch doesn't handle the possibility that the crypto capabilities of a
DM device may change at runtime after the initial table is loaded. While it
may be possible to handle the case with (possibly quite) some effort, the
use case might be unlikely enough in practice that it doesn't matter right
now. This patch also only exposes the intersection of the underlying
device's capabilities, which has the effect of causing en/decryption of a
bio to fall back to the kernel crypto API (if the fallback is enabled)
whenever any of the underlying devices doesn't support the encryption
context of the bio - it might be possible to make the bio only fall back to
the kernel crypto API if the bio's target underlying device doesn't support
the bio's encryption context, but again, the use case may be uncommon
enough in the first place not to warrant worrying about it right now.

Patch 3 makes some DM targets opt-in to passing through inline encryption
support. It does not (yet) try to enable this option with dm-raid, since
users can "hot add" disks to a raid device, which makes this not completely
straightforward (we'll need to ensure that any "hot added" disks must have
a superset of the inline encryption capabilities of the rest of the disks
in the raid device, due to the way Patch 2 of this series works).

Eric Biggers (2):
  dm: add support for passing through inline crypto support
  dm: enable may_passthrough_inline_crypto on some targets

Satya Tangirala (1):
  block: keyslot-manager: Introduce passthrough keyslot manager

 block/blk-crypto.c              |  1 +
 block/keyslot-manager.c         | 75 +++++++++++++++++++++++++++
 drivers/md/dm-core.h            |  4 ++
 drivers/md/dm-flakey.c          |  1 +
 drivers/md/dm-linear.c          |  1 +
 drivers/md/dm-table.c           | 52 +++++++++++++++++++
 drivers/md/dm-zero.c            |  1 +
 drivers/md/dm.c                 | 92 ++++++++++++++++++++++++++++++++-
 include/linux/device-mapper.h   |  6 +++
 include/linux/keyslot-manager.h |  9 ++++
 10 files changed, 241 insertions(+), 1 deletion(-)

-- 
2.28.0.618.gf4bc123cb7-goog

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

