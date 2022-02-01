Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C03D14A63DC
	for <lists+dm-devel@lfdr.de>; Tue,  1 Feb 2022 19:32:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643740367;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9H1cYBlORdIbMUzoeCUhJr2W+QRiHeEp52wS5fYU0Tg=;
	b=Q90CVzEDlHpqV5tIBr5RHu705sy5FPIEn6OXW14oPfpXcMlexEW4IJ37KDjYYWWHm/0Nfp
	BUaBfnDWOIhYEImqHRMEzyNWxi5xUn+65UcTDB06rASufBCrtF8dOlRd7ywjZi9t4BG6WI
	WO32MnbdeFs2N/MgeK5dWWcVjxG1eok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-r4ULVSKiN7-3i3lbVf-Q2Q-1; Tue, 01 Feb 2022 13:32:46 -0500
X-MC-Unique: r4ULVSKiN7-3i3lbVf-Q2Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6432B8144E0;
	Tue,  1 Feb 2022 18:32:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AAC2753F5;
	Tue,  1 Feb 2022 18:32:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 831314BB7C;
	Tue,  1 Feb 2022 18:32:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 211IW7b3003722 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 1 Feb 2022 13:32:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 791CA79A0F; Tue,  1 Feb 2022 18:32:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A93EA798D8;
	Tue,  1 Feb 2022 18:31:52 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 211IVqOM019366; Tue, 1 Feb 2022 13:31:52 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 211IVpQx019362; Tue, 1 Feb 2022 13:31:51 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 1 Feb 2022 13:31:51 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: =?ISO-8859-15?Q?Javier_Gonz=E1lez?= <javier@javigon.com>
In-Reply-To: <20220201102122.4okwj2gipjbvuyux@mpHalley-2>
Message-ID: <alpine.LRH.2.02.2202011327350.22481@file01.intranet.prod.int.rdu2.redhat.com>
References: <f0e19ae4-b37a-e9a3-2be7-a5afb334a5c3@nvidia.com>
	<20220201102122.4okwj2gipjbvuyux@mpHalley-2>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: "djwong@kernel.org" <djwong@kernel.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"clm@fb.com" <clm@fb.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"osandov@fb.com" <osandov@fb.com>,
	"msnitzer@redhat.com >> msnitzer@redhat.com" <msnitzer@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	"roland@purestorage.com" <roland@purestorage.com>,
	"zach.brown@ni.com" <zach.brown@ni.com>,
	Chaitanya Kulkarni <chaitanyak@nvidia.com>,
	"josef@toxicpanda.com" <josef@toxicpanda.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dsterba@suse.com" <dsterba@suse.com>,
	"kbus @imap.gmail.com>> Keith Busch" <kbusch@kernel.org>,
	"Frederick.Knight@netapp.com" <Frederick.Knight@netapp.com>,
	Jens Axboe <axboe@kernel.dk>, "tytso@mit.edu" <tytso@mit.edu>,
	Kanchan Joshi <joshi.k@samsung.com>,
	"martin.petersen@oracle.com >> Martin K. Petersen"
	<martin.petersen@oracle.com>, "jack@suse.com" <jack@suse.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	"lsf-pc@lists.linux-foundation.org" <lsf-pc@lists.linux-foundation.org>
Subject: [dm-devel] [RFC PATCH 0/3] NVMe copy offload patches
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

Here I'm submitting the first version of NVMe copy offload patches as a
request for comment. They use the token-based approach as we discussed on
the phone call.

The first patch adds generic copy offload support to the block layer - it
adds two new bio types (REQ_OP_COPY_READ_TOKEN and
REQ_OP_COPY_WRITE_TOKEN) and a new ioctl BLKCOPY and a kernel function
blkdev_issue_copy.

The second patch adds copy offload support to the NVMe subsystem.

The third patch implements a "nvme-debug" driver - it is similar to
"scsi-debug", it simulates a nvme host controller, it keeps data in memory
and it supports copy offload according to NVMe Command Set Specification
1.0a. (there are no hardware or software implementations supporting copy
offload so far, so I implemented it in nvme-debug)

TODO:
* implement copy offload in device mapper linear target
* implement copy offload in software NVMe target driver
* make it possible to complete REQ_OP_COPY_WRITE_TOKEN bios asynchronously
* should we use copy_file_range instead of a new ioctl?

How to test this:
* apply the three patches
* select CONFIG_NVME_DEBUG
* compile the kernel
* modprobe nvme-debug; nvme connect -t debug -a 123 -n 456
* issue the BLKCOPY ioctl on /dev/nvme0n1, for example, you can use this
  program:
  http://people.redhat.com/~mpatocka/patches/kernel/xcopy/example/blkcopy.c

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

