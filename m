Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 95E22273897
	for <lists+dm-devel@lfdr.de>; Tue, 22 Sep 2020 04:33:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600742006;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DA2YQ8GbYVXgbeMapdWLDxKSpzRftqLOpT8mbYAFi4I=;
	b=DENnG5YLKvKilcV+qyndIxBmagCp+7iY4aOb1up9ZkmFUKqOHJjWAPBTB3DXpPWIA3PT+v
	uPYbJH6w8ocUcNtZ6bxNgqjLoP77uioiEq4wkJfdjy4FWbXBlTqDPR4rn+AcnuIdl4OjRY
	FjoTRZclXmKD/xTGtw50ESZYTEk+sIw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-nZ0tNCoYPHy8imyQB_2pMA-1; Mon, 21 Sep 2020 22:33:23 -0400
X-MC-Unique: nZ0tNCoYPHy8imyQB_2pMA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1BA58030A5;
	Tue, 22 Sep 2020 02:33:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67EF855768;
	Tue, 22 Sep 2020 02:33:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5933E8C7CA;
	Tue, 22 Sep 2020 02:33:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08M2X1ri017657 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 22:33:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 32FA810F8E23; Tue, 22 Sep 2020 02:33:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AA9B10FD2B5
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 02:32:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C09480158E
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 02:32:58 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-157-YZK9bciyPb2idKT9uh84hQ-1; Mon, 21 Sep 2020 22:32:53 -0400
X-MC-Unique: YZK9bciyPb2idKT9uh84hQ-1
Received: by mail-qt1-f193.google.com with SMTP id c18so14412050qtw.5;
	Mon, 21 Sep 2020 19:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=DeORg/Avi6UTarc0WAXwKqD4ftKvKnlgc2tVUh2+vWc=;
	b=tE57PQA6x8VCoaKhCR9UStBQOy9r9JliJey4y3AeHyP0CADYeMm0Wj2UflMxKNomaj
	KQpccPw696kTJ+Zcluyt4KiOt5QsNOOQ6ID/CXHVto623ygVn3SGwq8GFQ65Gu4DJUP/
	TJUIuide/5KX1LF1nXlpzWGpJB0VHhcOhqrRGpTc1I3u8R0S9Xs9hMuXAa2naBzRgl5z
	n2QoS/H0wos/rjKFOQ9d6i7FM7XXFgGI9dCJaFRU6qaAVugmV3JiVrLndr+mJ4uZq4VT
	oMZE8WsEDULlfQYnvE5HnIRo0nk98aR6SMpObcEmE21kRtKgdngCnZGoVRX6UVJZ0M2C
	rc2g==
X-Gm-Message-State: AOAM530ecul1KP5RQLblq+FthFexg2t78mpeawQU0SCBaP/tGNrww9aR
	di374deYbzknj2NtobtOY18=
X-Google-Smtp-Source: ABdhPJyUJXhBcMnkCVVrqqHfUi0f3qbcsL6V/AQb+KvF0wSzxIh2h4/hIr1mbauuYqmLR6B9gjMb1A==
X-Received: by 2002:aed:29a6:: with SMTP id o35mr2676430qtd.123.1600741973292; 
	Mon, 21 Sep 2020 19:32:53 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	v15sm10853900qkg.108.2020.09.21.19.32.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 21 Sep 2020 19:32:51 -0700 (PDT)
From: Mike Snitzer <snitzer@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 21 Sep 2020 22:32:45 -0400
Message-Id: <20200922023251.47712-1-snitzer@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Vijayendra Suman <vijayendra.suman@oracle.com>,
	Ming Lei <ming.lei@redhat.com>
Subject: [dm-devel] [PATCH v3 0/6] dm: fix then improve bio splitting
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Patches 1 and 2 are queued for me to send to Linus later this week.

Patches 3 and 4 are block core and should get picked up for 5.10.
Jens, please pick them up. I revised the header for patch 4 to give
better context for use-case where non power-of-2 chunk_sectors
occurs. Patch 4 enables DM to switch to using blk_max_size_offset() in
Patch 6.

Patches 5 and 6 just show how DM will be enhanced for 5.10 once
patches 3 and 4 land in the block tree.

Mike Snitzer (6):
  dm: fix bio splitting and its bio completion order for regular IO
  dm: fix comment in dm_process_bio()
  block: use lcm_not_zero() when stacking chunk_sectors
  block: allow 'chunk_sectors' to be non-power-of-2
  dm table: stack 'chunk_sectors' limit to account for target-specific splitting
  dm: change max_io_len() to use blk_max_size_offset()

 block/blk-settings.c   | 22 ++++++++++++----------
 drivers/md/dm-table.c  |  5 +++++
 drivers/md/dm.c        | 47 +++++++++++++----------------------------------
 include/linux/blkdev.h | 12 +++++++++---
 4 files changed, 39 insertions(+), 47 deletions(-)

-- 
2.15.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

