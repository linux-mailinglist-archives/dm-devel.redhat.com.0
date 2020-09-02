Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 20EAC25B351
	for <lists+dm-devel@lfdr.de>; Wed,  2 Sep 2020 20:03:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599069812;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=98PXmSGiGK5IThFVNevY3/i8x+PVRgU9xpviZfgifbY=;
	b=X26OT2RE3T0Pzz/Gimx4gY0qDghUsgUzAGfJMC2gZUG2nzL3VeJVvGtHm81MUatkV2dpoS
	wLjoSxlhl35ELzsdTipUoqBTJjsKQUjLqpMzelxADuGZLP6SgXAjy0zQYgdON37m/CNE8M
	797nEriq4MzDMXLBkQlUu9T2KQRvFWk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-7PFMu96ENn6VUVyGWWqtTg-1; Wed, 02 Sep 2020 14:03:29 -0400
X-MC-Unique: 7PFMu96ENn6VUVyGWWqtTg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73CDE64087;
	Wed,  2 Sep 2020 18:03:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3926D5D9D3;
	Wed,  2 Sep 2020 18:03:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 87DE079DB3;
	Wed,  2 Sep 2020 18:03:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 082I2uuR017422 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Sep 2020 14:02:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1F7F92028E91; Wed,  2 Sep 2020 18:02:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19FCC202450E
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 18:02:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C1831021F7C
	for <dm-devel@redhat.com>; Wed,  2 Sep 2020 18:02:53 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-250-fE1KZOZGOxe0CA8Ev28Iag-1; Wed, 02 Sep 2020 14:02:50 -0400
X-MC-Unique: fE1KZOZGOxe0CA8Ev28Iag-1
Received: by mail-qk1-f193.google.com with SMTP id w186so583261qkd.1;
	Wed, 02 Sep 2020 11:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mime-version:content-disposition;
	bh=vIBmK6vhWxHKs0ESDe7uLeTvdWL4ZGeuqEYmWXXwi70=;
	b=nEhKXgvaSKUEgGaxqWkVM2dPH8pnSTbPWpEI17mQ7+60bdtoeMdTI9I6XfHMqk76Cv
	3HpRUcb+T5CylMQNvMiIsIzhI1dhE7hm6CY+WfZJQteUsDkpCbrXF5R/qYL+WJb2AIcz
	haItJGnYzMDsRXW6McDQD9aP2HxsY4K0qHWPuwz6d7qVMC0nI36bV1CnNCozGTBbNxiP
	0Wxb7NpDIy+3emGMairgmrSbqtWXYLmV296X14BmwTdqcWmmKS/SKGNPasR1d6S/wc/s
	iyK1y5UEcJctFzolN7YfYCPe8/DSMa89r1ireW48nwVfUp7HQauBdIUnjxkMl4cPli7b
	mTyg==
X-Gm-Message-State: AOAM532R/PKSXn7DF3fmE/XtOHKMmvv/G/CPnhqGut5pxZ6o1LVTMCbD
	YZwpC+mTnnzrQUEEE6GMua8=
X-Google-Smtp-Source: ABdhPJxh4bvVqdx4jTSEyzKQqDoihYZ1SjWbcCZtlvmyVjXHii7UmKhk8J7z1pGn28RKclTIuz6+Bw==
X-Received: by 2002:a05:620a:1025:: with SMTP id
	a5mr8206499qkk.490.1599069770211; 
	Wed, 02 Sep 2020 11:02:50 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52])
	by smtp.gmail.com with ESMTPSA id i7sm246793qkb.131.2020.09.02.11.02.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 02 Sep 2020 11:02:49 -0700 (PDT)
Date: Wed, 2 Sep 2020 14:02:48 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200902180248.GA32957@lobo>
MIME-Version: 1.0
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
	Alasdair G Kergon <agk@redhat.com>, Ye Bin <yebin10@huawei.com>
Subject: [dm-devel] [git pull] device mapper fixes for 5.9-rc4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Linus,

The following changes since commit f75aef392f869018f78cfedf3c320a6b3fcfda6b:

  Linux 5.9-rc3 (2020-08-30 16:01:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.9/dm-fixes

for you to fetch changes up to 3a653b205f29b3f9827a01a0c88bfbcb0d169494:

  dm thin metadata: Fix use-after-free in dm_bm_set_read_only (2020-09-02 13:38:40 -0400)

Please pull, thanks!
Mike

----------------------------------------------------------------
- DM writecache fix to allow dax_direct_access() to partitioned pmem
  devices.

- DM multipath fix to avoid any Path Group initialization if
  'pg_init_in_progress' isn't set.

- DM crypt fix to use DECLARE_CRYPTO_WAIT() for onstack wait
  structures.

- DM integrity fix to properly check integrity after device creation
  when in bitmap mode.

- DM thinp and cache target __create_persistent_data_objects() fixes
  to reset the metadata's dm_block_manager pointer from PTR_ERR to
  NULL before returning from error path.

- DM persistent-data block manager fix to guard against
  dm_block_manager NULL pointer dereference in dm_bm_is_read_only()
  and update various opencoded bm->read_only checks to use
  dm_bm_is_read_only() instead.

----------------------------------------------------------------
Damien Le Moal (1):
      dm crypt: Initialize crypto wait structures

Mike Snitzer (1):
      dm mpath: fix racey management of PG initialization

Mikulas Patocka (2):
      dm writecache: handle DAX to partitions on persistent memory correctly
      dm integrity: fix error reporting in bitmap mode after creation

Ye Bin (3):
      dm cache metadata: Avoid returning cmd->bm wild pointer on error
      dm thin metadata:  Avoid returning cmd->bm wild pointer on error
      dm thin metadata: Fix use-after-free in dm_bm_set_read_only

 drivers/md/dm-cache-metadata.c                |  8 ++++++--
 drivers/md/dm-crypt.c                         |  4 ++--
 drivers/md/dm-integrity.c                     | 12 ++++++++++++
 drivers/md/dm-mpath.c                         | 22 +++++++++++++++-------
 drivers/md/dm-thin-metadata.c                 | 10 +++++++---
 drivers/md/dm-writecache.c                    | 12 ++++++++++--
 drivers/md/persistent-data/dm-block-manager.c | 14 ++++++++------
 7 files changed, 60 insertions(+), 22 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

