Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA8A354848
	for <lists+dm-devel@lfdr.de>; Mon,  5 Apr 2021 23:49:22 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-3v1ckBjiNzWfW_z7QCAJwA-1; Mon, 05 Apr 2021 17:49:19 -0400
X-MC-Unique: 3v1ckBjiNzWfW_z7QCAJwA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3115687A826;
	Mon,  5 Apr 2021 21:49:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 719105D743;
	Mon,  5 Apr 2021 21:49:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 853B54BB7C;
	Mon,  5 Apr 2021 21:48:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 135LmWOn018502 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 5 Apr 2021 17:48:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BB7B82166BB3; Mon,  5 Apr 2021 21:48:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B50C12166BA4
	for <dm-devel@redhat.com>; Mon,  5 Apr 2021 21:48:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D8F585A5A8
	for <dm-devel@redhat.com>; Mon,  5 Apr 2021 21:48:30 +0000 (UTC)
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
	[185.70.41.103]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-447-DqGtH5SUMDWgsJhguOelHg-1; Mon, 05 Apr 2021 17:48:27 -0400
X-MC-Unique: DqGtH5SUMDWgsJhguOelHg-1
Received: from mail-03.mail-europe.com (mail-03.mail-europe.com
	[91.134.188.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4FDkYR62hnz4x1d5
	for <dm-devel@redhat.com>; Mon,  5 Apr 2021 21:38:35 +0000 (UTC)
Date: Mon, 05 Apr 2021 21:38:15 +0000
To: "dm-devel@redhat.com" <dm-devel@redhat.com>
From: Steven Walter <steven@stevenwalter.org>
Message-ID: <qht-GXTFAoALDkOdy7P1N_r7btdiZCXcMViG6BJemvQosZP-eMW7rUNTO4D4dDWb8fGe416U2PUYTvdFNftD2J2bcsiaiWZXVZnQxdTnzXo=@stevenwalter.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 135LmWOn018502
X-loop: dm-devel@redhat.com
Subject: [dm-devel] dm-init.c: boot up race with partitions
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: Steven Walter <steven@stevenwalter.org>
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I am using the dm-mod.create kernel command line parameter to create a verity device at boot.  Both the data device and hash device are partitions on an eMMC device.  Seemingly at random, the verity device fails to be created at boot because dm_init_init() (and wait_for_device_probe()) returned before the partitions had been scanned:

mmc1: new high speed MMC card at address 0001
device-mapper: table: 253:0: verity: Data device lookup failed
device-mapper: ioctl: error adding target to table
mmcblk1: mmc1:0001 064G30 58.2 GiB
mmcblk1boot0: mmc1:0001 064G30 partition 1 4.00 MiB
mmcblk1boot1: mmc1:0001 064G30 partition 2 4.00 MiB
mmcblk1rpmb: mmc1:0001 064G30 partition 3 4.00 MiB, chardev (247:0)
 mmcblk1: p1 p2 p3 p4 p5 p6 p7

I don't see how wait_for_device_probe() knows when partition scanning has been completed.  Is this a race or am I missing something?
--
- Steven Walter <steven@stevenwalter.org>
Sent from ProtonMail, encrypted email based in Switzerland.


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

