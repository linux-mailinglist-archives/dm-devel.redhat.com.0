Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3E92B1F03C8
	for <lists+dm-devel@lfdr.de>; Sat,  6 Jun 2020 02:20:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591402855;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UQ/HqtxnJ0hYe26MXE1NcD6356L3eMvTziADB3lhmNk=;
	b=JEkR3ju1KHtmtO4RjDQncW+siDcxkPrKVcXMSgof69x0Gdr8JXJTISdEYeqeb9Tq9JC1Dl
	RBb2AjbwqjuIQ7dIp0RjPobjre8rrfK3esZWJPtAHcAvqF/A7r4trI8+bfJB4ZAEURueCt
	XPhtx320J7zMDEs00BNPDt3CezpukII=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-u8CgKKA4NrihllmucChwpQ-1; Fri, 05 Jun 2020 20:20:53 -0400
X-MC-Unique: u8CgKKA4NrihllmucChwpQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 880CB83DB39;
	Sat,  6 Jun 2020 00:20:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67FC978FDE;
	Sat,  6 Jun 2020 00:20:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2A0BE8742C;
	Sat,  6 Jun 2020 00:20:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0557mu71006069 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 03:48:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 30039100B715; Fri,  5 Jun 2020 07:48:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22F4010F1CA4
	for <dm-devel@redhat.com>; Fri,  5 Jun 2020 07:48:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E367C801019
	for <dm-devel@redhat.com>; Fri,  5 Jun 2020 07:48:53 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-341-oFNpCYnrPS66yvR3xi2ylQ-1; Fri, 05 Jun 2020 03:48:49 -0400
X-MC-Unique: oFNpCYnrPS66yvR3xi2ylQ-1
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 643FB298906CD4DE6AFD;
	Fri,  5 Jun 2020 15:32:35 +0800 (CST)
Received: from code-website.localdomain (10.175.104.175) by
	DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server
	id 14.3.487.0; Fri, 5 Jun 2020 15:32:26 +0800
From: yangerkun <yangerkun@huawei.com>
To: <bgurney@redhat.com>, <agk@redhat.com>, <snitzer@redhat.com>
Date: Fri, 5 Jun 2020 15:31:59 +0800
Message-ID: <20200605073201.1742675-1-yangerkun@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0557mu71006069
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 05 Jun 2020 09:30:21 -0400
Cc: dm-devel@redhat.com, yangerkun@huawei.com
Subject: [dm-devel] [RFC 0/2] introduce interface to list all badblocks
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

We can add/remove/query the badblocks, but no interface to list all
badblocks when we want to know the badblocks we ever set still
available. Add message listbadblocks to do this.

To list all bad block list, run the following message command:

    $ sudo dmsetup message dust1 0 listbadblocks

We will get following message(image that we have insert block 1/2, and
we will list the block index in order)::

device-mapper: dust: dust_list_badblocks: badblocks list as below:
    device-mapper: dust: bad block: 1
    device-mapper: dust: bad block: 2
    device-mapper: dust: dust_list_badblocks: badblocks list end.



yangerkun (2):
  dm dust: add interface to list all badblocks
  dm dust: introduce listbadblocks in the rst

 .../admin-guide/device-mapper/dm-dust.rst     | 16 ++++++++++++++
 drivers/md/dm-dust.c                          | 21 +++++++++++++++++++
 2 files changed, 37 insertions(+)

-- 
2.25.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

