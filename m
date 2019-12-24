Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 67F7F12CA92
	for <lists+dm-devel@lfdr.de>; Sun, 29 Dec 2019 20:14:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1577646842;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QETooqCEg+FXm74b8ofWr0c/AL0abAmdQxdWc6AGu9w=;
	b=HfsKlc51g6/FgdsIucv55r2ketrSQ3ZZMQNDd3B1dA1pm4gCUZpdnwGyhiQW/XcYqRPd9U
	PIUnZJvZ5fGHhb6MxM4htHiRg86B9G43jwPKTkhWZFEMbhCHTn1CpMZJtLGU24ShyYnvLV
	0I3sm2utbtddYSjG1HqSCclhK6uMTPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-erSuqV1SOx2_FO_iyEJDig-1; Sun, 29 Dec 2019 14:13:11 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32CA4107ACCA;
	Sun, 29 Dec 2019 19:13:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEF0677FF2;
	Sun, 29 Dec 2019 19:13:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C070D18089CF;
	Sun, 29 Dec 2019 19:12:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBO6V0oe027273 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Dec 2019 01:31:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 16811C691B; Tue, 24 Dec 2019 06:31:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11FDDD0B23
	for <dm-devel@redhat.com>; Tue, 24 Dec 2019 06:30:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E51B80209E
	for <dm-devel@redhat.com>; Tue, 24 Dec 2019 06:30:58 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-190-R0tpwN0kNeaXu7gP7xJM2Q-1; Tue, 24 Dec 2019 01:30:56 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id DE938BC95A83F0C780BC;
	Tue, 24 Dec 2019 14:30:51 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
	(10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Tue, 24 Dec 2019
	14:30:42 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <agk@redhat.com>, <snitzer@redhat.com>, <dm-devel@redhat.com>
Date: Tue, 24 Dec 2019 14:37:59 +0800
Message-ID: <1577169483-138896-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-MC-Unique: R0tpwN0kNeaXu7gP7xJM2Q-1
X-MC-Unique: erSuqV1SOx2_FO_iyEJDig-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBO6V0oe027273
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Sun, 29 Dec 2019 14:12:32 -0500
Cc: zhengbin13@huawei.com
Subject: [dm-devel] [PATCH 0/4] dm: use true,false for bool variable
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

zhengbin (4):
  dm mpath: use true,false for bool variable
  dm bio prison v2: use true,false for bool variable
  dm snapshot: use true,false for bool variable
  dm thin metadata: use true,false for bool variable

 drivers/md/dm-bio-prison-v2.c |  2 +-
 drivers/md/dm-mpath.c         |  2 +-
 drivers/md/dm-snap.c          |  6 +++---
 drivers/md/dm-thin-metadata.c | 10 +++++-----
 4 files changed, 10 insertions(+), 10 deletions(-)

--
2.7.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

