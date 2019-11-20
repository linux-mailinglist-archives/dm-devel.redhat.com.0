Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 56B6A103DFA
	for <lists+dm-devel@lfdr.de>; Wed, 20 Nov 2019 16:06:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574262380;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pS8NP4OPrkCMT+dUaUQ5kTULvbQ0xLuNc5qzwaf2SxI=;
	b=VLQXps187zrZc4lIMe3s/fYM8KW5tWij6sR4g6DWNHQR3hBNFWz8Tqhv6vgxrMDtua4P6b
	z6zGN76otonCF8du0MVM1+qxrvVC+4Zud6KdeTfJjxztuVp10EBPLdhHa2IdmtI6XKyGfz
	DRS9KZ/vVlcM+13q0JxGaU6Y2qvnYkM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-k1Tp5mReOseyQH9dBDvdow-1; Wed, 20 Nov 2019 10:06:16 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 922ED107B769;
	Wed, 20 Nov 2019 15:06:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5448C60252;
	Wed, 20 Nov 2019 15:06:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 226904BB5C;
	Wed, 20 Nov 2019 15:06:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAKDfMVd002056 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 20 Nov 2019 08:41:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7B5302166BDC; Wed, 20 Nov 2019 13:41:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 774C12166BD5
	for <dm-devel@redhat.com>; Wed, 20 Nov 2019 13:41:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4B98801021
	for <dm-devel@redhat.com>; Wed, 20 Nov 2019 13:41:20 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-186-MTE-bH7bNhW6cUgWnNnvIw-1;
	Wed, 20 Nov 2019 08:41:16 -0500
Received: from localhost.localdomain (unknown [118.189.143.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id CD670224FC;
	Wed, 20 Nov 2019 13:41:12 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 20 Nov 2019 21:41:10 +0800
Message-Id: <20191120134110.14859-1-krzk@kernel.org>
X-MC-Unique: MTE-bH7bNhW6cUgWnNnvIw-1
X-MC-Unique: k1Tp5mReOseyQH9dBDvdow-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAKDfMVd002056
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 20 Nov 2019 10:05:49 -0500
Cc: Mike Snitzer <snitzer@redhat.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	linux-raid@vger.kernel.org, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>
Subject: [dm-devel] [PATCH] md: Fix Kconfig indentation
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
=09$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/md/Kconfig | 54 +++++++++++++++++++++++-----------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
index aa98953f4462..d6d5ab23c088 100644
--- a/drivers/md/Kconfig
+++ b/drivers/md/Kconfig
@@ -38,9 +38,9 @@ config MD_AUTODETECT
 =09default y
 =09---help---
 =09  If you say Y here, then the kernel will try to autodetect raid
-=09  arrays as part of its boot process.=20
+=09  arrays as part of its boot process.
=20
-=09  If you don't use raid and say Y, this autodetection can cause=20
+=09  If you don't use raid and say Y, this autodetection can cause
 =09  a several-second delay in the boot time due to various
 =09  synchronisation steps that are part of this step.
=20
@@ -290,7 +290,7 @@ config DM_SNAPSHOT
        depends on BLK_DEV_DM
        select DM_BUFIO
        ---help---
-         Allow volume managers to take writable snapshots of a device.
+=09 Allow volume managers to take writable snapshots of a device.
=20
 config DM_THIN_PROVISIONING
        tristate "Thin provisioning target"
@@ -298,7 +298,7 @@ config DM_THIN_PROVISIONING
        select DM_PERSISTENT_DATA
        select DM_BIO_PRISON
        ---help---
-         Provides thin provisioning and snapshots that share a data store.
+=09 Provides thin provisioning and snapshots that share a data store.
=20
 config DM_CACHE
        tristate "Cache target (EXPERIMENTAL)"
@@ -307,23 +307,23 @@ config DM_CACHE
        select DM_PERSISTENT_DATA
        select DM_BIO_PRISON
        ---help---
-         dm-cache attempts to improve performance of a block device by
-         moving frequently used data to a smaller, higher performance
-         device.  Different 'policy' plugins can be used to change the
-         algorithms used to select which blocks are promoted, demoted,
-         cleaned etc.  It supports writeback and writethrough modes.
+=09 dm-cache attempts to improve performance of a block device by
+=09 moving frequently used data to a smaller, higher performance
+=09 device.  Different 'policy' plugins can be used to change the
+=09 algorithms used to select which blocks are promoted, demoted,
+=09 cleaned etc.  It supports writeback and writethrough modes.
=20
 config DM_CACHE_SMQ
        tristate "Stochastic MQ Cache Policy (EXPERIMENTAL)"
        depends on DM_CACHE
        default y
        ---help---
-         A cache policy that uses a multiqueue ordered by recent hits
-         to select which blocks should be promoted and demoted.
-         This is meant to be a general purpose policy.  It prioritises
-         reads over writes.  This SMQ policy (vs MQ) offers the promise
-         of less memory utilization, improved performance and increased
-         adaptability in the face of changing workloads.
+=09 A cache policy that uses a multiqueue ordered by recent hits
+=09 to select which blocks should be promoted and demoted.
+=09 This is meant to be a general purpose policy.  It prioritises
+=09 reads over writes.  This SMQ policy (vs MQ) offers the promise
+=09 of less memory utilization, improved performance and increased
+=09 adaptability in the face of changing workloads.
=20
 config DM_WRITECACHE
 =09tristate "Writecache target"
@@ -343,9 +343,9 @@ config DM_ERA
        select DM_PERSISTENT_DATA
        select DM_BIO_PRISON
        ---help---
-         dm-era tracks which parts of a block device are written to
-         over time.  Useful for maintaining cache coherency when using
-         vendor snapshots.
+=09 dm-era tracks which parts of a block device are written to
+=09 over time.  Useful for maintaining cache coherency when using
+=09 vendor snapshots.
=20
 config DM_CLONE
        tristate "Clone target (EXPERIMENTAL)"
@@ -353,20 +353,20 @@ config DM_CLONE
        default n
        select DM_PERSISTENT_DATA
        ---help---
-         dm-clone produces a one-to-one copy of an existing, read-only sou=
rce
-         device into a writable destination device. The cloned device is
-         visible/mountable immediately and the copy of the source device t=
o the
-         destination device happens in the background, in parallel with us=
er
-         I/O.
+=09 dm-clone produces a one-to-one copy of an existing, read-only source
+=09 device into a writable destination device. The cloned device is
+=09 visible/mountable immediately and the copy of the source device to the
+=09 destination device happens in the background, in parallel with user
+=09 I/O.
=20
-         If unsure, say N.
+=09 If unsure, say N.
=20
 config DM_MIRROR
        tristate "Mirror target"
        depends on BLK_DEV_DM
        ---help---
-         Allow volume managers to mirror logical volumes, also
-         needed for live data migration tools such as 'pvmove'.
+=09 Allow volume managers to mirror logical volumes, also
+=09 needed for live data migration tools such as 'pvmove'.
=20
 config DM_LOG_USERSPACE
 =09tristate "Mirror userspace logging"
@@ -483,7 +483,7 @@ config DM_FLAKEY
        tristate "Flakey target"
        depends on BLK_DEV_DM
        ---help---
-         A target that intermittently fails I/O for debugging purposes.
+=09 A target that intermittently fails I/O for debugging purposes.
=20
 config DM_VERITY
 =09tristate "Verity target support"
--=20
2.17.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

