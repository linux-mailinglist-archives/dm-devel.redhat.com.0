Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 84D5028D166
	for <lists+dm-devel@lfdr.de>; Tue, 13 Oct 2020 17:41:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602603697;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Rwr4gbTs/RRFrdzX2UUN78BJFm1c0DETBAsYeqjt7tY=;
	b=Jqwtt99qiA9F7Lrn8N6U+ri5PF5wuPzKLc4npvEpXCW0ZUIvDI+ZBSryReCkx8OmgTVGKH
	baUdRqqTO49CsVVz2YPVT3C4wBnNrtH1oyfRgA2jajmQF3xsAHVwW1lXXmsjIQxEcbDQkq
	tUCOwEBzVQb+VU4OM/My5HLSkSdNWro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-1e4gnIxLOGeYmvCOdjVoeQ-1; Tue, 13 Oct 2020 11:41:35 -0400
X-MC-Unique: 1e4gnIxLOGeYmvCOdjVoeQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9EB41018F7C;
	Tue, 13 Oct 2020 15:41:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6197A60C0F;
	Tue, 13 Oct 2020 15:41:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B0BC58100;
	Tue, 13 Oct 2020 15:40:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09DFeEEO026997 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 13 Oct 2020 11:40:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5545B82CFF; Tue, 13 Oct 2020 15:40:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EA0A11329
	for <dm-devel@redhat.com>; Tue, 13 Oct 2020 15:40:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FDEE803531
	for <dm-devel@redhat.com>; Tue, 13 Oct 2020 15:40:07 +0000 (UTC)
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-588-bMU3UEPNNOeAyTVSUAln5w-1; Tue, 13 Oct 2020 11:40:03 -0400
X-MC-Unique: bMU3UEPNNOeAyTVSUAln5w-1
Received: by mail-il1-f196.google.com with SMTP id p9so345097ilr.1;
	Tue, 13 Oct 2020 08:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:mime-version:content-disposition;
	bh=BWuxsuYMy3Ft55pYDqFEGYRHo/hYknbOtywffUE0H5w=;
	b=ujNAdLOPe3FW6lY79C1o5GaKHFh02KRzxxIQJJJQC76Idr4y09N7ZrkaA3MkoPuV/S
	eGEeuXEBADTGRB3roKaSR1gcqJItVDNY+wbUXwqQgVAaJ3JvoPQ6m7tnemvYLNdubtKs
	UTofWwKaodtKTXcbFZ+VEbrbCUhABa/gtpeiZCvCq5/slYcHS1rs4wrrTr1C1gOjtGKr
	AzgG9CConXG8UXsGpLnuhrDfRCyXXuvhevGYODE1W6VY/ZVPAfsxiY748PcQhh22SCwa
	DStGtxb1JKv+HMsvVUuv4pZgDA/hnjZ3PI3GAEWA6sNxOOOUCPM+8K87kZtgKrZgnRno
	HH8g==
X-Gm-Message-State: AOAM530lP3cGYuIkl1NpNgM0Y0/QMtSMmU+I1rNfNpiWYy89iMO05vEb
	SwxipRf5iIIv7T0uFZZIBro=
X-Google-Smtp-Source: ABdhPJw+v+8uC/SgIsasTewA6kgT3YFEGQloMx7V+htsbeYNSiAqG3w6VuLhFnFx/uWvPZkxeTAg3Q==
X-Received: by 2002:a05:6e02:1110:: with SMTP id
	u16mr433826ilk.181.1602603602118; 
	Tue, 13 Oct 2020 08:40:02 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52])
	by smtp.gmail.com with ESMTPSA id b17sm105160ilo.86.2020.10.13.08.40.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 13 Oct 2020 08:40:01 -0700 (PDT)
Date: Tue, 13 Oct 2020 11:40:00 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20201013154000.GA53766@lobo>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Huaisheng Ye <yehs1@lenovo.com>, Mike Snitzer <snitzer@redhat.com>,
	Qinglang Miao <miaoqinglang@huawei.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>, Alasdair G Kergon <agk@redhat.com>
Subject: [dm-devel] [git pull] device mapper changes for 5.10
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

This pull's changes depend on various linux-block changes (as noted in
the refernced merge commit's header).

The following changes since commit 1471308fb5ec4335f9ae9fc65f65048dbe7c336e:

  Merge remote-tracking branch 'jens/for-5.10/block' into dm-5.10 (2020-09-29 16:31:35 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.10/dm-changes

for you to fetch changes up to 681cc5e8667e8579a2da8fa4090c48a2d73fc3bb:

  dm: fix request-based DM to not bounce through indirect dm_submit_bio (2020-10-07 18:08:51 -0400)

Please pull, thanks.
Mike

----------------------------------------------------------------
- Improve DM core's bio splitting to use blk_max_size_offset(). Also
  fix bio splitting for bios that were deferred to the worker thread
  due to a DM device being suspended.

- Remove DM core's special handling of NVMe devices now that block
  core has internalized efficiencies drivers previously needed to
  be concerned about (via now removed direct_make_request).

- Fix request-based DM to not bounce through indirect dm_submit_bio;
  instead have block core make direct call to blk_mq_submit_bio().

- Various DM core cleanups to simplify and improve code.

- Update DM cryot to not use drivers that set
  CRYPTO_ALG_ALLOCATES_MEMORY.

- Fix DM raid's raid1 and raid10 discard limits for the purposes of
  linux-stable. But then remove DM raid's discard limits settings now
  that MD raid can efficiently handle large discards.

- A couple small cleanups across various targets.

----------------------------------------------------------------
Huaisheng Ye (1):
      dm thin metadata: Remove unused local variable when create thin and snap

Mike Snitzer (17):
      dm table: stack 'chunk_sectors' limit to account for target-specific splitting
      dm: change max_io_len() to use blk_max_size_offset()
      dm: push md->immutable_target optimization down to __process_bio()
      dm: optimize max_io_len() by inlining max_io_len_target_boundary()
      dm: push use of on-stack flush_bio down to __send_empty_flush()
      dm: simplify __process_abnormal_io()
      dm: eliminate need for start_io_acct() forward declaration
      dm table: make 'struct dm_table' definition accessible to all of DM core
      dm: use dm_table_get_device_name() where appropriate in targets
      dm raid: fix discard limits for raid1 and raid10
      dm raid: remove unnecessary discard limits for raid10
      dm: fix missing imposition of queue_limits from dm_wq_work() thread
      dm: fold dm_process_bio() into dm_submit_bio()
      dm: fix comment in __dm_suspend()
      dm: export dm_copy_name_and_uuid
      dm: remove special-casing of bio-based immutable singleton target on NVMe
      dm: fix request-based DM to not bounce through indirect dm_submit_bio

Mikulas Patocka (1):
      dm crypt: don't use drivers that have CRYPTO_ALG_ALLOCATES_MEMORY

Qinglang Miao (1):
      dm snap persistent: simplify area_io()

 block/blk-mq.c                        |   1 -
 drivers/md/dm-cache-target.c          |   2 +-
 drivers/md/dm-core.h                  |  56 ++++-
 drivers/md/dm-crypt.c                 |  17 +-
 drivers/md/dm-ioctl.c                 |   2 +-
 drivers/md/dm-mpath.c                 |  16 +-
 drivers/md/dm-raid.c                  |   9 -
 drivers/md/dm-rq.c                    |   2 +-
 drivers/md/dm-snap-persistent.c       |  11 +-
 drivers/md/dm-table.c                 |  84 +------
 drivers/md/dm-thin-metadata.c         |   6 +-
 drivers/md/dm.c                       | 404 +++++++++++-----------------------
 drivers/md/dm.h                       |   3 -
 drivers/md/persistent-data/dm-btree.c |   3 +-
 include/linux/device-mapper.h         |   1 -
 include/uapi/linux/dm-ioctl.h         |   4 +-
 16 files changed, 224 insertions(+), 397 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

