Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD412761A8
	for <lists+dm-devel@lfdr.de>; Wed, 23 Sep 2020 22:07:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600891654;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0qwNXomWEnnPh3SEY6aIzhAR/V9MX+AzpMsrwigfVF8=;
	b=HEhyyTk7IWA01OGkJ5bbXn8fZeQznGYGcG5JjwTDwnG94iQeBZy6cWeohTAa08yfqXIlMU
	Axgmx9XV/mkb1miGkTFVPFK3tKIxB8URCROqb8fu+OV1KcgKeTFxoQgBu9527TJo+6ozaq
	HXYBX7VG7/YFqvFP4XBRG2AgaG3C7k8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-3HYLup6oNHq5ABkl90H38g-1; Wed, 23 Sep 2020 16:07:31 -0400
X-MC-Unique: 3HYLup6oNHq5ABkl90H38g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7FE31800D4A;
	Wed, 23 Sep 2020 20:07:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C6F65C1C7;
	Wed, 23 Sep 2020 20:07:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 13F2F18095FF;
	Wed, 23 Sep 2020 20:07:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08NK6xJP027856 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 23 Sep 2020 16:06:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E1EEBC6106; Wed, 23 Sep 2020 20:06:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD92E108BCE
	for <dm-devel@redhat.com>; Wed, 23 Sep 2020 20:06:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32F6B800962
	for <dm-devel@redhat.com>; Wed, 23 Sep 2020 20:06:56 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-331-tY2ibJ2YMeatECnnS8fIGA-1; Wed, 23 Sep 2020 16:06:54 -0400
X-MC-Unique: tY2ibJ2YMeatECnnS8fIGA-1
Received: by mail-qk1-f193.google.com with SMTP id q63so1033596qkf.3
	for <dm-devel@redhat.com>; Wed, 23 Sep 2020 13:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=DcI9qzORAmpASB52sXLs4QqTzINHknlH96I3Bxuml6Y=;
	b=Wx954r7oDzA6jljEOLUI9yRS4FjQSQmw4etEG8sEyMXybcoeetQgmlav18Axq63IUf
	eOSX2hLpv3oCm8TgyzNls8tFnhNoZr7agAYfMvqa0ItSZm5zg2CfYDOxwM8uyl6t2bDa
	OdoX5mxdaIJJSlGNVrjAHU8sm2BB3xg9dZw4L6WC2Np6veAHP5nPNSwkyMXnRLA91xiw
	wM1jwE34NZuLriRPM2o2x87oRSBbyTQS3agQyZQIicnv7Y3q0GeTCTZ4eRgRhnkO9O9y
	umTBtGE7drNzvcV5i7WVjpqBnMBSKumHdu+yiohxpvZM89QxeXwi/xEk74MTD5YuT9TO
	ILYg==
X-Gm-Message-State: AOAM533hUbxIkPNTsSZ71+ou8RAL3kqHvMlmvTKZ3SXIaZcQlvKptsJ9
	MmD9Gle6rlMFePhL83rPSeFWOG+B43f2PoLg
X-Google-Smtp-Source: ABdhPJxjk1Sp228tEBGNnm6jJLqzdkYXuLuQ3XUPPHsTMISElcknjzIthwkbM/aOpzptN9icZDPNJw==
X-Received: by 2002:a37:a548:: with SMTP id o69mr1584707qke.113.1600891613443; 
	Wed, 23 Sep 2020 13:06:53 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52])
	by smtp.gmail.com with ESMTPSA id m97sm604091qte.55.2020.09.23.13.06.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 23 Sep 2020 13:06:52 -0700 (PDT)
From: Mike Snitzer <snitzer@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 23 Sep 2020 16:06:50 -0400
Message-Id: <20200923200652.11082-1-snitzer@redhat.com>
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
Cc: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	linux-block@vger.kernel.org, dm-devel@redhat.com, hch@lst.de
Subject: [dm-devel] [PATCH 0/2] block/dm: add REQ_NOWAIT support for
	bio-based
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I got guilted into this by this Twitter exchange:
https://twitter.com/axboe/status/1308778488011337728

Started with this patchset from June and revised it:
https://patchwork.kernel.org/project/dm-devel/list/?series=297693
(dropped MD patch while doing so_.

Tested these changes with this test Jens provided:

[mikes-test-job]
filename=/dev/dm-0
rw=randread
buffered=1
ioengine=io_uring
iodepth=16
norandommap

Jens, please feel free to pickup both patches, I don't have any
conflicting DM changes for 5.10.

Thanks,
Mike

Konstantin Khlebnikov (1):
  dm: add support for REQ_NOWAIT and enable it for linear target

Mike Snitzer (1):
  block: add QUEUE_FLAG_NOWAIT

 block/blk-core.c              |  4 ++--
 drivers/md/dm-linear.c        |  5 +++--
 drivers/md/dm-table.c         | 32 ++++++++++++++++++++++++++++++++
 drivers/md/dm.c               |  4 +++-
 include/linux/blkdev.h        |  7 +++++--
 include/linux/device-mapper.h |  6 ++++++
 6 files changed, 51 insertions(+), 7 deletions(-)

-- 
2.15.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

