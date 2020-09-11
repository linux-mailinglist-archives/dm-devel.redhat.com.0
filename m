Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 000B9266A61
	for <lists+dm-devel@lfdr.de>; Fri, 11 Sep 2020 23:54:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599861288;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=DFcboWtpMjEQcN4qkBGvs6rXgp6jHJH6JGrOKcGKH+8=;
	b=gEgH82fww9/NEyzfMCgP9iPfQ6Ix3qqcrUGcmpDqannTEVLg3y9aQgZw9oWbF0dMK1hBn7
	RuPLOgtJu2yR6hIYXrrPRQ7kNJZPn1mT0ke2bIqVweFPppNMnU+6d2R2SjqvYbe1BFwZYG
	kRmMYkvkMUpdRShnB2C3zqij7x+zjpA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-VgeCtQ4mOOy1wxHNMuDOHA-1; Fri, 11 Sep 2020 17:54:45 -0400
X-MC-Unique: VgeCtQ4mOOy1wxHNMuDOHA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE3C8AF208;
	Fri, 11 Sep 2020 21:54:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1331675120;
	Fri, 11 Sep 2020 21:54:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BED5E79FF7;
	Fri, 11 Sep 2020 21:54:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08BLrmQW020427 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 11 Sep 2020 17:53:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 89DE42018035; Fri, 11 Sep 2020 21:53:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8507D2026F94
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 21:53:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3BEE811E76
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 21:53:45 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-480-OsF23DAmNI2XH1L1c_hSDQ-1; Fri, 11 Sep 2020 17:53:41 -0400
X-MC-Unique: OsF23DAmNI2XH1L1c_hSDQ-1
Received: by mail-qk1-f195.google.com with SMTP id o16so11354782qkj.10;
	Fri, 11 Sep 2020 14:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to;
	bh=G04JF2pKkU3Et5jfoho48Oyq+62stIClH7lP76/hVsw=;
	b=F7hfZmGN+hp5N6UklHB5swgWff6aUDKgy5XOlUpaCLLs/W6AM9ZBa/I3TLzqF6iD2B
	bGqoVeqedU7zzM92U5usJJIaUKuJVXQnNVBMjNfMFikPRntoifIF5ci12l0kxR/Kh2sq
	yjn6CT6yULZNUjJ9TejsyNZ8f7xWE1LqS18gw7W+wRofIB59Xro7vGuZV5R+A0AE+YJf
	am7+Zobyx3j5vrvg2rmRF6qpdMs1TPt5uPiqpioP/BI+rlX92HV0V46CxxpguEVy+PxX
	O1c4hZHmPbJ6iZPvqjT1PKbnPHZ5tZtzEEKAqjb/7k68EHbOKSNQFZmtqC8y1AKbl5dO
	AR8g==
X-Gm-Message-State: AOAM533x1iLVL3ggRsnu4xSU2itnsWD+n++kLbQV9S2Iz7eClYEDfCdb
	G2Tz7XYBaPH7y1/UE+QRtCCkt8ySeOo=
X-Google-Smtp-Source: ABdhPJwgeLTfsIYVaPcyQ/WJS01DI4mJwHCJud4bXvtWVHuZMRNibqENkQ6mSYR4El/4hTD1wVzw8w==
X-Received: by 2002:a37:b347:: with SMTP id c68mr3462124qkf.430.1599861220463; 
	Fri, 11 Sep 2020 14:53:40 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	r42sm4488262qtk.29.2020.09.11.14.53.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Sep 2020 14:53:39 -0700 (PDT)
From: Mike Snitzer <snitzer@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
Date: Fri, 11 Sep 2020 17:53:35 -0400
Message-Id: <20200911215338.44805-1-snitzer@redhat.com>
In-Reply-To: <20200911161344.GA28614@redhat.com>
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
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Vijayendra Suman <vijayendra.suman@oracle.com>
Subject: [dm-devel] [PATCH 0/3] block: a few chunk_sectors fixes/improvements
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Here are some changes that seem needed but that stop short of fixing the
initial report (of DM pgbench regression).  Would be nice if you could
review these block patches since they stand on their own.

I still have to look closer at how to get blk_queue_split() the info DM
has (in ti->max_io_len). Ideally a variant of blk_queue_split() could be
created that allows a 'chunk_sectors' override to be passed in, e.g.:
dm_process_bio() would call: blk_queue_split(&bio, ti->max_io_len);
And the provided ti->max_io_len would be used instead of a global (one
size fits all) q->limits.chunk_sectors.  The reason why this is
needed/ideal is due to DM's stacked nature.  Different offsets into a DM
device could yield entirely different max_io_len (or chunk_sectors)
settings.

BUT short of standing up a new variant of blk_queue_split() with per bio
override for 'chunk_sectors' (which is likely a non-starter for a few
reasons, recurssive nature of bio_split being the biggest): I'll need to
update all DM targets that call dm_set_target_max_io_len() to also do
this in each target's .io_hints hook:
  limits->chunk_sectors = lcm_not_zero(ti->max_io_len, limits->chunk_sectors);
Won't be perfect for some stacked devices (given it'll constrain
chunk_sectors to be less optimal as the IO limits are stacked) but it
should be an improvment -- and hopefully fix this pgbench regression.

Thanks,
Mike

Mike Snitzer (3):
  block: fix blk_rq_get_max_sectors() to flow more carefully
  block: use lcm_not_zero() when stacking chunk_sectors
  block: allow 'chunk_sectors' to be non-power-of-2

 block/blk-settings.c   | 22 ++++++++++++----------
 include/linux/blkdev.h | 31 ++++++++++++++++++++++---------
 2 files changed, 34 insertions(+), 19 deletions(-)

-- 
2.15.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

