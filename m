Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DE65620325B
	for <lists+dm-devel@lfdr.de>; Mon, 22 Jun 2020 10:47:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592815661;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XdRVDTz0zu1JEh0yB6QRpIryGijKqJSsmqitObYaVq8=;
	b=EdkDlEloyE3o+zgryU1GU8gbBGZH5YJe/22fxBCMzsGWfK/d5dRJBZZhClE6OOvxuUPyA5
	/x/cBrW6S1kyVHQpC4LhwKDxH5w2w5o1Oc1yeKQCS2PgNyF95nFLwzcb4olvrybCr1A/hn
	U5KpcxQWZse4SlCYyp5YsljVsjGK9zg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-tvdQy-PjPr6HKGCp1o2gdw-1; Mon, 22 Jun 2020 04:47:37 -0400
X-MC-Unique: tvdQy-PjPr6HKGCp1o2gdw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55F8F18A8229;
	Mon, 22 Jun 2020 08:47:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BF7A19D81;
	Mon, 22 Jun 2020 08:47:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DE504833C3;
	Mon, 22 Jun 2020 08:47:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JGg0ZO028980 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 12:42:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B1244202696C; Fri, 19 Jun 2020 16:42:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACAED2026D67
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 16:41:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3007833B45
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 16:41:57 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-508-euf0udD2P_2XLcY_TwhXkg-1; Fri, 19 Jun 2020 12:41:53 -0400
X-MC-Unique: euf0udD2P_2XLcY_TwhXkg-1
Received: by mail-wm1-f68.google.com with SMTP id g21so5234210wmg.0
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 09:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dItvvC2lt6E+qFq6CNnb5fhaaaf/EERuUxlUZLYBRLQ=;
	b=ZAyYT0uIoMNbX5xuSIN2CkoMjpEZpePjApUPRSJns5PgBqexfyQRSc2a+/WGMX4zi5
	sV6FSFD4MgVmpSRUTHMMURUtWDf2gr325JIslVE+Zcld0gRvAcC5DGirvOn19j3NBo0d
	VQGrgr++asoCuFxmHH2H71xdLESRMCn/A1nn5EUYxFL9z7m770tGZ5RD0K0XViaf7H+p
	lmiRWYAXJQyWm4ME4tM2+cOLQfekABi5U4U08QBpfPSWIHnG7AVOhLwIs3LO3Su6gAbJ
	SPwAKl52BwuYenogCuvLMi9Lkhl0X0pYfoLGiWmt4IzkZtjqgFshQK8GmJ3lsRYU7Mtp
	TtqA==
X-Gm-Message-State: AOAM531UcNVly9tPKd/7FnfX5TpyusdqclJWx3gZJzNznuBIWNofqfaI
	SSDnjab/MZPwVn5WrTqT7EvD9w==
X-Google-Smtp-Source: ABdhPJzdXUR+Gako3OmnLmhC8kzsj9i3PW+bOnvUQp2RQX5o4Fbiwj3ONT0EGc8mcpuSXlm9I2wznQ==
X-Received: by 2002:a7b:cb11:: with SMTP id u17mr4596054wmj.84.1592584911912; 
	Fri, 19 Jun 2020 09:41:51 -0700 (PDT)
Received: from localhost.localdomain (88-144-169-85.host.pobb.as13285.net.
	[88.144.169.85])
	by smtp.gmail.com with ESMTPSA id j4sm7521901wma.7.2020.06.19.09.41.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 19 Jun 2020 09:41:51 -0700 (PDT)
From: Ignat Korchagin <ignat@cloudflare.com>
To: agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com, dm-crypt@saout.de,
	linux-kernel@vger.kernel.org
Date: Fri, 19 Jun 2020 17:41:31 +0100
Message-Id: <20200619164132.1648-1-ignat@cloudflare.com>
MIME-Version: 1.0
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 22 Jun 2020 04:47:18 -0400
Cc: kernel-team@cloudflare.com, Ignat Korchagin <ignat@cloudflare.com>
Subject: [dm-devel] [RFC PATCH 0/1] dm-crypt excessive overhead
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is a follow up from the long-forgotten [1], but with some more convincing
evidence. Consider the following script:

#!/bin/bash -e

# create 4G ramdisk
sudo modprobe brd rd_nr=1 rd_size=4194304

# create a dm-crypt device with NULL cipher on top of /dev/ram0
echo '0 8388608 crypt capi:ecb(cipher_null) - 0 /dev/ram0 0' | sudo dmsetup create eram0

# create a dm-crypt device with NULL cipher and custom force_inline flag
echo '0 8388608 crypt capi:ecb(cipher_null) - 0 /dev/ram0 0 1 force_inline' | sudo dmsetup create inline-eram0

# read all data from /dev/ram0
sudo dd if=/dev/ram0 bs=4k iflag=direct | sha256sum

# read the same data from /dev/mapper/eram0
sudo dd if=/dev/mapper/eram0 bs=4k iflag=direct | sha256sum

# read the same data from /dev/mapper/inline-eram0
sudo dd if=/dev/mapper/inline-eram0 bs=4k iflag=direct | sha256sum

This script creates a ramdisk (to eliminate hardware bias in the benchmark) and
two dm-crypt instances on top. Both dm-crypt instances use the NULL cipher
to eliminate potentially expensive crypto bias (the NULL cipher just uses memcpy
for "encyption"). The first instance is the current dm-crypt implementation from
5.8-rc1, the second is the dm-crypt instance with a custom new flag enabled from
the patch attached to this thread. On my VM (Debian in VirtualBox with 4 cores
on 2.8 GHz Quad-Core Intel Core i7) I get the following output (formatted for
better readability):

# plain ram0
1048576+0 records in
1048576+0 records out
4294967296 bytes (4.3 GB, 4.0 GiB) copied, 21.2305 s, 202 MB/s
8479e43911dc45e89f934fe48d01297e16f51d17aa561d4d1c216b1ae0fcddca  -

# eram0 (current dm-crypt)
1048576+0 records in
1048576+0 records out
4294967296 bytes (4.3 GB, 4.0 GiB) copied, 53.2212 s, 80.7 MB/s
8479e43911dc45e89f934fe48d01297e16f51d17aa561d4d1c216b1ae0fcddca  -

# inline-eram0 (patched dm-crypt)
1048576+0 records in
1048576+0 records out
4294967296 bytes (4.3 GB, 4.0 GiB) copied, 21.3472 s, 201 MB/s
8479e43911dc45e89f934fe48d01297e16f51d17aa561d4d1c216b1ae0fcddca  -

As we can see, current dm-crypt implementation creates a significant IO
performance overhead (at least on small IO block sizes) for both latency and
throughput. We suspect offloading IO request processing into workqueues and
async threads is more harmful these days with the modern fast storage. I also
did some digging into the dm-crypt git history and much of this async processing
is not needed anymore, because the reasons it was added are mostly gone from the
kernel. More details can be found in [2] (see "Git archeology" section).

We have been running the attached patch on different hardware generations in
more than 200 datacentres on both SATA SSDs and NVME SSDs and so far were very
happy with the performance benefits.

[1]: https://www.spinics.net/lists/dm-crypt/msg07516.html
[2]: https://blog.cloudflare.com/speeding-up-linux-disk-encryption/

Ignat Korchagin (1):
  Add DM_CRYPT_FORCE_INLINE flag to dm-crypt target

 drivers/md/dm-crypt.c | 55 +++++++++++++++++++++++++++++++++----------
 1 file changed, 43 insertions(+), 12 deletions(-)

-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

