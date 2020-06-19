Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF7D2008E4
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 14:40:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592570405;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=p713Gcrg+mULuj3GCqQkhDqVCnHi66bhie3iY+vapxs=;
	b=EL0kH1GB1166WRWywUQlfqIUYf7/0ddP6BRHgR3G71rizSx4+Pf56nExeLA43huw9j+Oz9
	qN2WSeSuFoq12JlURTC4aMSPzMpjGPaGJgu40HbFdrZ2BR6xgRsL3n4uCWorPtDvZWplns
	xhYaOBasBwC2/cCmGwSJc3DmEHdtzxY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-ayWTTqLdMUyZ83aQ5yFWHg-1; Fri, 19 Jun 2020 08:39:27 -0400
X-MC-Unique: ayWTTqLdMUyZ83aQ5yFWHg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79E83107ACF7;
	Fri, 19 Jun 2020 12:39:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BA635BAD8;
	Fri, 19 Jun 2020 12:39:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C018833D0;
	Fri, 19 Jun 2020 12:39:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JCbHrk027959 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 08:37:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B4F8120267F2; Fri, 19 Jun 2020 12:37:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0A992026D67
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 12:37:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AE918007AC
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 12:37:17 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-48-hLhHEjMANo-24K2-SQshxw-1; Fri, 19 Jun 2020 08:37:06 -0400
X-MC-Unique: hLhHEjMANo-24K2-SQshxw-1
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id AA5EDA9ED93B0E5D4EA8;
	Fri, 19 Jun 2020 20:36:59 +0800 (CST)
Received: from code-website.localdomain (10.175.127.227) by
	DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server
	id 14.3.487.0; Fri, 19 Jun 2020 20:36:51 +0800
From: yangerkun <yangerkun@huawei.com>
To: <snitzer@redhat.com>, <bgurney@redhat.com>, <agk@redhat.com>,
	<bmr@redhat.com>
Date: Fri, 19 Jun 2020 20:37:59 +0800
Message-ID: <20200619123803.1441373-1-yangerkun@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05JCbHrk027959
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 19 Jun 2020 08:38:54 -0400
Cc: dm-devel@redhat.com, yangerkun@huawei.com
Subject: [dm-devel] [PATCH v3 0/4] introduce interface to list badblocks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since .message support report results to user directly. We can change
some type of message(queryblock/countbadblocks/removebadblock) to return
results to user.

Besides, we add a interface 'listbadblocks' to list all bad block. If
no bad block exists, we will return 'null', or we will list them multi
line which each line means one bad block.

v2->v3:
Realize this logical in .message, change logical for some type message to
report results to user too.

yangerkun (4):
  dm dust: report some message results back to user directly
  dm dust: update doc after message results report to user directly
  dm dust: add interface to list all badblocks
  dm dust: introduce listbadblocks in the rst

 .../admin-guide/device-mapper/dm-dust.rst     | 31 +++++++---
 drivers/md/dm-dust.c                          | 58 ++++++++++++++-----
 2 files changed, 69 insertions(+), 20 deletions(-)

-- 
2.25.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

