Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AEDA6BB7
	for <lists+dm-devel@lfdr.de>; Tue,  3 Sep 2019 16:42:21 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 16ED6106E294;
	Tue,  3 Sep 2019 14:42:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2941F601A5;
	Tue,  3 Sep 2019 14:42:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 18CE0E202;
	Tue,  3 Sep 2019 14:42:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x83Cb51G005874 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Sep 2019 08:37:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CBE6360166; Tue,  3 Sep 2019 12:37:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B91B6012C;
	Tue,  3 Sep 2019 12:36:59 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0CCFE308FC22;
	Tue,  3 Sep 2019 12:36:59 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id i8so4647543edn.13;
	Tue, 03 Sep 2019 05:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=X+JOjjC9ZVu192uQtB4c+PagHpVwrX1ckHNApDJzFx4=;
	b=shACxTOdGhf746uYGbysRNVKvvDBq+FtlkRxg22lR/WWvFgbINsfw97jbqcnipn8d6
	7ziGigbhzXm9x7AejOCUflas0/quQhqoNytjxLpCD9bdIKohxu/00WQ3Zmllcxr7iJRL
	FwXbpOgMj9s47di5YPfJQETREm90LEaoMzY4lXoQ9UyB76yazUk8kp7n1wXbdux79g7Q
	fSWSoUtLh3GKb03ICbCrYirSWh3uXp3KvEWtLj8q+tm6BaCzXznROjEh5lqVTJolcos8
	6l2jnpSFhlTGwFT+N/WHZaQM2APatjKRGNqviGNVy2rAet+ovziIWK9OHAjMm/Br3VI0
	rOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=X+JOjjC9ZVu192uQtB4c+PagHpVwrX1ckHNApDJzFx4=;
	b=p9SiE79CAB0gARmJjiEgXshF1Roacrn7En+VwzfFT7O0MuljE22AQr7SnjbXT4O4UH
	05uHozolr+SmlQKT6Uz1c8yS+0x8oLR4HYNzNOOvuZi0ioSQdEE81hyRQe5h76a+Knte
	l20QXkE6ZFdNX57V3gOXxEM5xxjr5Crk2+xxVEIwku0Pg24/HDQgGlP4fEfrKmtqNlsW
	uSEFNgd0jrWN9NMP9IqTy4dS8JjcW1tLLERxAhW8+hsX1IeiAcK77TAlFFsowoBzh2TW
	f0sOJfulgFfo316WHzcRav1B/in+YmJpwg/oy4UaMXWeecKxXeQpm0ju7ZrWoXxyVvmT
	Thig==
X-Gm-Message-State: APjAAAU6Lf3N115XV0kbfUOhfQ2QLhCX2VibJa8os9V9QFhr/OFQ1FyA
	bamy0htoairTblBP+TnMLSJ/M6jUSRRP5A+BKNPZx6GU
X-Google-Smtp-Source: APXvYqwsNfvafGEiRyz40BWvbFExKtfeTVOTJ5DuTi/JgrhmCKiKMbArB4z6BmT03Lr0MgzyGNeEzERLYJg+HPLgs64=
X-Received: by 2002:a50:a147:: with SMTP id 65mr17334939edj.241.1567514217476; 
	Tue, 03 Sep 2019 05:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.LRH.2.02.1908291142470.17653@file01.intranet.prod.int.rdu2.redhat.com>
	<20190902105909.ah4pi4nwjefygskd@10.255.255.10>
In-Reply-To: <20190902105909.ah4pi4nwjefygskd@10.255.255.10>
From: Anatoly Pugachev <matorola@gmail.com>
Date: Tue, 3 Sep 2019 15:36:46 +0300
Message-ID: <CADxRZqwURQJMCCAkY8TvjBaQnCL9j1AHN3mY6b1q3bN-VCZRyA@mail.gmail.com>
To: Karel Zak <kzak@redhat.com>, Mikulas Patocka <mpatocka@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 03 Sep 2019 12:36:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Tue, 03 Sep 2019 12:36:59 +0000 (UTC) for IP:'209.85.208.66'
	DOMAIN:'mail-ed1-f66.google.com' HELO:'mail-ed1-f66.google.com'
	FROM:'matorola@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.208.66 mail-ed1-f66.google.com 209.85.208.66
	mail-ed1-f66.google.com <matorola@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 03 Sep 2019 10:42:03 -0400
Cc: Heinz Mauelshagen <heinzm@redhat.com>,
	util-linux <util-linux@vger.kernel.org>,
	Mike Snitzer <msnitzer@redhat.com>, dm-devel@redhat.com,
	lvm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] blkid: retport block size of a filesystem
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Tue, 03 Sep 2019 14:42:20 +0000 (UTC)

On Mon, Sep 2, 2019 at 1:59 PM Karel Zak <kzak@redhat.com> wrote:
> Applied (with two small fixes), thanks!

Karel, Mikulas,

ts/blkid/low-probe started to fail on sparc64 with this patch:

        blkid: superblocks probing: [97] xfs-log             ... OK
        blkid: superblocks probing: [98] xfs                 ...
FAILED (blkid/low-probe-xfs)

but is "OK" on x86_64.

$ diff -u expected/blkid/low-probe-xfs output/blkid/low-probe-xfs
--- expected/blkid/low-probe-xfs        2019-09-03 12:45:18.779505561 +0300
+++ output/blkid/low-probe-xfs  2019-09-03 14:35:41.569815684 +0300
@@ -1,4 +1,4 @@
-ID_FS_BLOCK_SIZE=512
+ID_FS_BLOCK_SIZE=131072
 ID_FS_LABEL=test-xfs
 ID_FS_LABEL_ENC=test-xfs
 ID_FS_TYPE=xfs

$ md5sum output/blkid/images-fs/xfs.img
c4a59d4039b5ed5557e8502ca2906373  output/blkid/images-fs/xfs.img

(md5 is the same as on x86_64 test machine)

You can use gcc202 sparc64 machine from gcc compile farm for the test.

PS: can someone regenerate xfs.img(xz) with more recent XFS filesystem version?

$ xfs_info output/blkid/images-fs/xfs.img
xfs_info: V1 inodes unsupported. Please try an older xfsprogs.

$ dpkg -l xfsprogs
ii  xfsprogs       5.0.0-1      sparc64      Utilities for managing
the XFS filesystem

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
