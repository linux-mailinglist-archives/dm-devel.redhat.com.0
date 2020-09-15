Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0141426AA7D
	for <lists+dm-devel@lfdr.de>; Tue, 15 Sep 2020 19:25:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600190710;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PslOMUjkwx/4y59tPNKWDViezi9cK1iMtiPicwvu4ss=;
	b=HpNtaXErOOO0eMSlqn/cM2nZrsgNY97Ske45vPWiHgl1CqOLbhf/Ak6oVOFzkV9TCebzDR
	twVVd3gGCoZCSnZZ1/coOm5gbevSkxXeTXPMXMTgFIRvFwszg7xvGujCI1PDgrpVbrjPpF
	Ms/PrUCJtpKGDEXyZMrnw9laUiSTpOU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-N63cEzVpMt-yUWITl8NWiA-1; Tue, 15 Sep 2020 13:24:35 -0400
X-MC-Unique: N63cEzVpMt-yUWITl8NWiA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61E9A19273C3;
	Tue, 15 Sep 2020 17:24:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E978610AF;
	Tue, 15 Sep 2020 17:24:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EEC33183D022;
	Tue, 15 Sep 2020 17:24:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08FHOI16003202 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 13:24:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 28A4BC2171; Tue, 15 Sep 2020 17:24:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2429E2B4D28
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 17:24:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C67A906387
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 17:24:16 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-64-cJcCoOqTP8SYhwL9PXFyjw-1; Tue, 15 Sep 2020 13:23:59 -0400
X-MC-Unique: cJcCoOqTP8SYhwL9PXFyjw-1
Received: by mail-qt1-f194.google.com with SMTP id p65so3807948qtd.2;
	Tue, 15 Sep 2020 10:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=2hqoRFYX4/RLa6tKmbcUnG/L6B7zQSKyUsPW11aTc3A=;
	b=nWTN0VT4fETDoJqbpgjqfFThIBnwS64BcQwH9P1MPLYlywq0/kV+3rhZhSpW8+2azR
	tTZBPMc+4pQlXmkFScB4pHU6yhGw670+RI6vcaz4AaLWjRo3NvEKkFG4leIxKLZ/jzYY
	TIiOvV+Qay5YBvSh3ydolmQwP8f/bIQTKcmLloczVptVRXeorJILazeYDZOoq2VvOS9G
	Skz1fW+/5hJ0wonDga1uO11qFyXFYXo/zLDKwMAH4qQNgps8mxD2m14WAys54KgLUdb8
	b3szQTS1URrMkcKxBiaTKDk4U31u7Ewe289oGf783juoZHX3NZ4nngfu/RXXJZZ0LZLT
	6m+w==
X-Gm-Message-State: AOAM530CFnRpr/CxAwaShOXP5rx/e35r03gKe2Gz3XfZab0cY79gs8Hg
	qukthkzFtG4j3O7wmD3V7cA=
X-Google-Smtp-Source: ABdhPJzZDP79Xa1eA9O3rLpFxo16n8Rt8qBfBiXWHYs06WJdGl0dSfSX70HgwPO0HKeXuPrEQLG+4A==
X-Received: by 2002:ac8:424a:: with SMTP id r10mr18525300qtm.211.1600190638803;
	Tue, 15 Sep 2020 10:23:58 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	n11sm17088902qkk.105.2020.09.15.10.23.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 15 Sep 2020 10:23:57 -0700 (PDT)
From: Mike Snitzer <snitzer@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 15 Sep 2020 13:23:53 -0400
Message-Id: <20200915172357.83215-1-snitzer@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Vijayendra Suman <vijayendra.suman@oracle.com>,
	Ming Lei <ming.lei@redhat.com>
Subject: [dm-devel] [PATCH v2 0/4] block: a couple chunk_sectors
	fixes/improvements
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

This v2 drops a patch from v1 and fixes the chunk_sectprs check added to
blk_stack_limits to convert chubk_sectors to bytes before comparing with
physical_block_size.

Jens, please feel free to pick up patches 1 and 2.

DM patches 3 and 4 are provided just to give context for how DM will be
updated to use chunk_sectors.

Mike Snitzer (4):
  block: use lcm_not_zero() when stacking chunk_sectors
  block: allow 'chunk_sectors' to be non-power-of-2
  dm table: stack 'chunk_sectors' limit to account for target-specific splitting
  dm: unconditionally call blk_queue_split() in dm_process_bio()

 block/blk-settings.c   | 22 ++++++++++++----------
 drivers/md/dm-table.c  |  5 +++++
 drivers/md/dm.c        | 45 +--------------------------------------------
 include/linux/blkdev.h | 12 +++++++++---
 4 files changed, 27 insertions(+), 57 deletions(-)

-- 
2.15.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

