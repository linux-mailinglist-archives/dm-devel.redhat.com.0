Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A713E1ED0BA
	for <lists+dm-devel@lfdr.de>; Wed,  3 Jun 2020 15:26:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591190765;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DqQqrLuIodchPrkoCA1cmxz6HnTsswxfYlhjVm9t0xM=;
	b=OLrwNigCYOJiuk1j8ShHW31m5DHC21w3BNgSFQb02IFq9Oia/mQ03nwNoT0g63QN2TWjjW
	LZ02oSQz48ZHOBjSJMr4iXZjozu9S8zDbGloVGLAByp7VceXVbfpwAWNBGr9uV8MnD/Pa2
	6vgZlxMQVQOaYGDcT3KeK7PFnHBK8RE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-glt4G02dMtq89pVtHCFByQ-1; Wed, 03 Jun 2020 09:26:02 -0400
X-MC-Unique: glt4G02dMtq89pVtHCFByQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28B9180058E;
	Wed,  3 Jun 2020 13:25:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D083579A5;
	Wed,  3 Jun 2020 13:25:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D61F6ADA87;
	Wed,  3 Jun 2020 13:25:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 051CbGSk013362 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jun 2020 08:37:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0FFB5110F3B6; Mon,  1 Jun 2020 12:37:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BE19110F3B4
	for <dm-devel@redhat.com>; Mon,  1 Jun 2020 12:37:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF2F8833B4A
	for <dm-devel@redhat.com>; Mon,  1 Jun 2020 12:37:12 +0000 (UTC)
Received: from forwardcorp1o.mail.yandex.net (forwardcorp1o.mail.yandex.net
	[95.108.205.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-513-etb7hWr8N8Ov3Iu81-HLPQ-1; Mon, 01 Jun 2020 08:37:10 -0400
X-MC-Unique: etb7hWr8N8Ov3Iu81-HLPQ-1
Received: from mxbackcorp1j.mail.yandex.net (mxbackcorp1j.mail.yandex.net
	[IPv6:2a02:6b8:0:1619::162])
	by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 8F31B2E1545;
	Mon,  1 Jun 2020 15:37:08 +0300 (MSK)
Received: from myt4-18a966dbd9be.qloud-c.yandex.net
	(myt4-18a966dbd9be.qloud-c.yandex.net
	[2a02:6b8:c00:12ad:0:640:18a9:66db])
	by mxbackcorp1j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
	Arbn6tmlSd-b7e8sZjq; Mon, 01 Jun 2020 15:37:08 +0300
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
	[2a02:6b8:b080:6420::1:8])
	by myt4-18a966dbd9be.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA
	id Ol7mDqdGP7-b1WG8Prs; Mon, 01 Jun 2020 15:37:01 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
To: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, linux-raid@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Mon, 01 Jun 2020 15:37:01 +0300
Message-ID: <159101473169.180989.12175693728191972447.stgit@buzz>
User-Agent: StGit/0.22-39-gd257
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 03 Jun 2020 09:25:45 -0400
Cc: Christoph Hellwig <hch@infradead.org>
Subject: [dm-devel] [PATCH RFC 0/3] block: allow REQ_NOWAIT to some
 bio-based/stacked devices
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Here is pretty straight forward attempt of handling REQ_NOWAIT for
bio-based and stacked devices.

They are marked with flag queue->limits.nowait_requests which tells that
queue method make_request() handles REQ_NOWAIT or doesn't delay requests,
and all backend devices do the same.

As a example second/third patches add support into md-raid0 and dm-linear.

---

Konstantin Khlebnikov (3):
      block: add flag 'nowait_requests' into queue limits
      md/raid0: enable REQ_NOWAIT
      dm: add support for REQ_NOWAIT and enable for target dm-linear


 drivers/md/dm-linear.c        | 5 +++--
 drivers/md/dm-table.c         | 3 +++
 drivers/md/dm.c               | 4 +++-
 drivers/md/raid0.c            | 3 +++
 include/linux/device-mapper.h | 6 ++++++
 5 files changed, 18 insertions(+), 3 deletions(-)

--
Signature

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

