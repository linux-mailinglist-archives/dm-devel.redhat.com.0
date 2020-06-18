Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC992008D5
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 14:39:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592570362;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=w2ywofUdRw9db1pGSOrKyyzoLbHNmFfr3R9U2IPY8kQ=;
	b=Zy1OM3CkepHgkWAnsvnx0hN0zNMIxxtdjoIenVWDbBwKhA74G+zM9ZSHcf80Rsngyh6Km1
	A3I0pg2ecuWj0JiZH+9QFx3H1mErde9aLDo3NGV7FnDHx7BPBHZrbhm5Sfso/EIo6zPG8g
	Vc93aD8StNDLeYO0I/es6p6D+HEWKP4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-cPCQg_MRPRmZhVdwLSOghw-1; Fri, 19 Jun 2020 08:39:20 -0400
X-MC-Unique: cPCQg_MRPRmZhVdwLSOghw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8E9E64AD0;
	Fri, 19 Jun 2020 12:39:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 441195C1D6;
	Fri, 19 Jun 2020 12:39:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F586833CF;
	Fri, 19 Jun 2020 12:39:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05I95VUD029486 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 05:05:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 65DE02029F6F; Thu, 18 Jun 2020 09:05:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DFE82029F62
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 09:05:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75E37811E7A
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 09:05:28 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-430-nGMzbv_yNkW2lXuXdwTilQ-1; Thu, 18 Jun 2020 05:05:23 -0400
X-MC-Unique: nGMzbv_yNkW2lXuXdwTilQ-1
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id A43AEBB80D7592E77E70;
	Thu, 18 Jun 2020 17:05:19 +0800 (CST)
Received: from code-website.localdomain (10.175.127.227) by
	DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server
	id 14.3.487.0; Thu, 18 Jun 2020 17:05:08 +0800
From: yangerkun <yangerkun@huawei.com>
To: <snitzer@redhat.com>, <bgurney@redhat.com>, <agk@redhat.com>,
	<bmr@redhat.com>
Date: Thu, 18 Jun 2020 17:06:18 +0800
Message-ID: <20200618090620.3517530-1-yangerkun@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05I95VUD029486
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 19 Jun 2020 08:38:54 -0400
Cc: dm-devel@redhat.com, yangerkun@huawei.com
Subject: [dm-devel] [PATCH v2 0/2] introduce interface to list all badblocks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


This patchset will list badblocks while we do 'dmsetup status'.

Image that we have mark block 1 and 2 as bad block, run following
command will list all bad blocks:

    $ sudo dmsetup status dust1
    0 33552384 dust 252:17 bypass verbose badblocks list: 1 2

v1->v2:
Realize this logical in dust_status instead dust_message since the
result can return to user directly.


yangerkun (2):
  dm dust: list badblock in dust_status
  dm dust: introduce list badblocks in the rst

 .../admin-guide/device-mapper/dm-dust.rst     | 14 +++++++++++
 drivers/md/dm-dust.c                          | 25 +++++++++++++++++++
 2 files changed, 39 insertions(+)

-- 
2.25.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

