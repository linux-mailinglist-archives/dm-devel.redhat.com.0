Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DB9612B43
	for <lists+dm-devel@lfdr.de>; Sun, 30 Oct 2022 16:39:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667144343;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CChp6oUvbDue0uaXDi9zdyBYjzzR0NXc1anYmqcCpYY=;
	b=aXMAVxlW/8IkzWygKCdaMolatHrCh7SvTrE3hxlGcUYdg+XA/T52McPDItVozRUGSj/7eX
	nKuIqATlIbyQLzrBA1c70t5hyHVAwYjuhJB1J0Ijb9gQtQEXtGHGGGUN4GgE3xnHjGRwEH
	2rBXvSwfZO39EGXQBfieykob9hM3/x4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-gSOk8dFUO2mWQOZiL_ztMA-1; Sun, 30 Oct 2022 11:39:01 -0400
X-MC-Unique: gSOk8dFUO2mWQOZiL_ztMA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5192F833A0E;
	Sun, 30 Oct 2022 15:38:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 343C0477F5C;
	Sun, 30 Oct 2022 15:38:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8FFB319465A3;
	Sun, 30 Oct 2022 15:38:56 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 472981946589
 for <dm-devel@listman.corp.redhat.com>; Sun, 30 Oct 2022 15:38:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 186252166B2F; Sun, 30 Oct 2022 15:38:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10E8B2166B29
 for <dm-devel@redhat.com>; Sun, 30 Oct 2022 15:38:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB24F833A09
 for <dm-devel@redhat.com>; Sun, 30 Oct 2022 15:38:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-7-QnUlRy8-OVa7gRhdqKtbOQ-1; Sun, 30 Oct 2022 11:38:47 -0400
X-MC-Unique: QnUlRy8-OVa7gRhdqKtbOQ-1
Received: from 213-225-37-80.nat.highway.a1.net ([213.225.37.80]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1opAHc-00HVfD-Gm; Sun, 30 Oct 2022 15:31:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>
Date: Sun, 30 Oct 2022 16:31:12 +0100
Message-Id: <20221030153120.1045101-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [dm-devel] fix delayed holder tracking v2
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: linux-block@vger.kernel.org, Yu Kuai <yukuai1@huaweicloud.com>,
 dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

this series tries to fix the delayed holder tracking that is only used by
dm by moving it into dm, where we can track the lifetimes much better.

Changes since v1: 
 - don't blow away ->bd_holder_dir in del_gendisk or add_disk failure
   as the holder unregistration references it
 - add an extra cleanup patch

Diffstat:
 block/genhd.c          |    6 --
 block/holder.c         |   85 ++++++++++------------------------
 drivers/md/dm.c        |  122 ++++++++++++++++++++++++++-----------------------
 include/linux/blkdev.h |    5 --
 4 files changed, 93 insertions(+), 125 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

