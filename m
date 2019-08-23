Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1D19B3A0
	for <lists+dm-devel@lfdr.de>; Fri, 23 Aug 2019 17:42:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34BBB898106;
	Fri, 23 Aug 2019 15:42:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5F142632E;
	Fri, 23 Aug 2019 15:42:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 32ACC1802217;
	Fri, 23 Aug 2019 15:42:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7NFg0F9004716 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 23 Aug 2019 11:42:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 472C718E3E; Fri, 23 Aug 2019 15:42:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D00E5DA8C;
	Fri, 23 Aug 2019 15:41:57 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CED393082131;
	Fri, 23 Aug 2019 15:41:56 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id x4so11604089qts.5;
	Fri, 23 Aug 2019 08:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=S58Ut6awFbXGbTVwROsmK/yvGl2uzNqGRXDVfJ8fjtI=;
	b=ki9tAwKfBTW+y3PAASIHa/Uk8nGbCOtOz6jBgofCXyvNpOpeNoUh7A9JQVIgtFBEHy
	ASoGvShJr0/fZeQxP70KehnjJ1LzMEtYjTeESjC7jjOfFc+NTcJf0uWDjVFuqViJPoUn
	IVvQHVb+CQM2wZlj6DGLVwZiuI2tT6/9ub9GiyW+gxFYeqZMzs+MVXimKmSGq+h2r09v
	PIZFhxYG0UCdblZDYzzy36IBTCc0kOsizhL4fFn6571TiWXAJyRhxx+beCFLkfvgxpV2
	gjUyZV8xABXR2PT0s/32YGRDFTbvP6AEATq/Ai/HgNqtKfZ1UqsZHMFaU+cdwzsG9vd8
	iwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mime-version:content-disposition:user-agent;
	bh=S58Ut6awFbXGbTVwROsmK/yvGl2uzNqGRXDVfJ8fjtI=;
	b=mYHZDkQJxvDL3ntdExFyWXy4vuJXSSlTlbxLs/Pf/fDhjnFEZxTKJjR4iBhyh21Gjm
	pxCFvvjSLFkUzXu5cgYwKuQrmyCzYDJpVIQ08+LP1Dcj3NJ3DN0tpAX42J381BYA0S+4
	RwDmG6Tfgqq+ws/0jOzUDV1YcKbxs3MYM8VTS9AwRPjM7KWRoCZH2+b8lUzBjmZtLl9u
	Etv122skPmz6jwv5TudEeSLiu9ziHE1Ec5PV5C0euOQvH1Z2QkBZ0THGOfRF7WUggkDH
	tndxiSR8NudjWt230Z2X9UsXGWPgsrd3r7S3aXd5c8+i/U+ihyMjRjHEZZqo+HwB4wez
	R1ag==
X-Gm-Message-State: APjAAAW5xwfCyKO6lqXoeUgIKXKkLRYzja0DYGBZeVMjVP9+VNW5+YDc
	ts6cAA5fBcQAwL30HEG1Clg=
X-Google-Smtp-Source: APXvYqwSnfUlkGS1tztrmwyBgMgAlVfIZEhOrURhEbQ5oVj4HH644m2tOyUdMAQ5G9Z8Vjuels2YZQ==
X-Received: by 2002:ac8:4a8f:: with SMTP id l15mr5442837qtq.29.1566574915981; 
	Fri, 23 Aug 2019 08:41:55 -0700 (PDT)
Received: from localhost (nat-pool-bos-t.redhat.com. [66.187.233.206])
	by smtp.gmail.com with ESMTPSA id
	x145sm1667988qka.106.2019.08.23.08.41.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Aug 2019 08:41:55 -0700 (PDT)
Date: Fri, 23 Aug 2019 11:41:53 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20190823154153.GA24648@lobo>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 23 Aug 2019 15:41:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Fri, 23 Aug 2019 15:41:57 +0000 (UTC) for IP:'209.85.160.196'
	DOMAIN:'mail-qt1-f196.google.com'
	HELO:'mail-qt1-f196.google.com' FROM:'snitzer@gmail.com' RCPT:''
X-RedHat-Spam-Score: 0.502  (DKIM_SIGNED, DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.160.196 mail-qt1-f196.google.com 209.85.160.196
	mail-qt1-f196.google.com <snitzer@gmail.com>
X-RedHat-Possible-Forgery: <snitzer@gmail.com> Mike Snitzer
	<snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Wenwen Wang <wenwen@cs.uga.edu>, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>, Alasdair G Kergon <agk@redhat.com>,
	ZhangXiaoxu <zhangxiaoxu5@huawei.com>,
	Dan Carpenter <dan.carpenter@oracle.com>, Bryan Gurney <bgurney@redhat.com>
Subject: [dm-devel] [git pull] device mapper fixes for 5.3-rc6
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]); Fri, 23 Aug 2019 15:42:27 +0000 (UTC)

Hi Linus,

More fixes than usual from DM at this stage in a release but...

The following changes since commit d45331b00ddb179e291766617259261c112db872:

  Linux 5.3-rc4 (2019-08-11 13:26:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.3/dm-fixes-2

for you to fetch changes up to 1cfd5d3399e87167b7f9157ef99daa0e959f395d:

  dm table: fix invalid memory accesses with too high sector number (2019-08-23 10:11:42 -0400)

Please pull, thanks!
Mike

----------------------------------------------------------------
- Revert a DM bufio change from during the 5.3 merge window now that a
  proper fix has been made to the block loopback driver.

- Fix DM kcopyd to wakeup so failed subjobs get completed.

- Various fixes to DM zoned target to address error handling, and other
  small tweaks (SPDX license identifiers and fix typos).

- Fix DM integrity range locking race by tracking whether journal has
  changed.

- Fix DM dust target to detect reads of badblocks beyond the first 512b
  sector (applicable if blocksize is larger than 512b).

- Fix DM persistent-data issue in both the DM btree and DM
  space-map-metadata interfaces.

- Fix out of bounds memory access with certain DM table configurations.

----------------------------------------------------------------
Bryan Gurney (1):
      dm dust: use dust block size for badblocklist index

Dan Carpenter (1):
      dm zoned: fix potential NULL dereference in dmz_do_reclaim()

Dmitry Fomichev (6):
      dm kcopyd: always complete failed jobs
      dm zoned: improve error handling in reclaim
      dm zoned: improve error handling in i/o map code
      dm zoned: properly handle backing device failure
      dm zoned: add SPDX license identifiers
      dm zoned: fix a few typos

Mikulas Patocka (3):
      Revert "dm bufio: fix deadlock with loop device"
      dm integrity: fix a crash due to BUG_ON in __journal_read_write()
      dm table: fix invalid memory accesses with too high sector number

Wenwen Wang (1):
      dm raid: add missing cleanup in raid_ctr()

ZhangXiaoxu (2):
      dm btree: fix order of block initialization in btree_split_beneath
      dm space map metadata: fix missing store of apply_bops() return value

 drivers/md/dm-bufio.c                              |  4 +-
 drivers/md/dm-dust.c                               | 11 +++-
 drivers/md/dm-integrity.c                          | 15 +++++
 drivers/md/dm-kcopyd.c                             |  5 +-
 drivers/md/dm-raid.c                               |  2 +-
 drivers/md/dm-table.c                              |  5 +-
 drivers/md/dm-zoned-metadata.c                     | 68 ++++++++++++++++------
 drivers/md/dm-zoned-reclaim.c                      | 47 +++++++++++----
 drivers/md/dm-zoned-target.c                       | 68 +++++++++++++++++++---
 drivers/md/dm-zoned.h                              | 11 ++++
 drivers/md/persistent-data/dm-btree.c              | 31 +++++-----
 drivers/md/persistent-data/dm-space-map-metadata.c |  2 +-
 12 files changed, 209 insertions(+), 60 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
