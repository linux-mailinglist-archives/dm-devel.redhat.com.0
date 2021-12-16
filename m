Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C77477B09
	for <lists+dm-devel@lfdr.de>; Thu, 16 Dec 2021 18:50:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639677007;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iVFpnsalUuOOwZ46LaQLiCBBjOASREWRIXNKnFZt9l8=;
	b=b59C/XMVzLZFUoIsrhZIGicdkY385Wvbr7ulOy3MTKdmm38YDeTgFADYjiLBFLtaqUzYRU
	alZvomAp+/VEyiKZ0rApXXMKGeipXdQ7j28Z8KFLG4F6PpkUh3bqWIfA9H0F8rp9yxJnUm
	ty77RM4DEawlsvDlcMpqLFYJZJ391vw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-dInqq_3gOYuXOaXRhlwrKQ-1; Thu, 16 Dec 2021 12:50:01 -0500
X-MC-Unique: dInqq_3gOYuXOaXRhlwrKQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45F2810144E2;
	Thu, 16 Dec 2021 17:49:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 979F17B01F;
	Thu, 16 Dec 2021 17:49:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC8824BB7C;
	Thu, 16 Dec 2021 17:49:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BGHnJFk016174 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Dec 2021 12:49:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BF8BA492D4F; Thu, 16 Dec 2021 17:49:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBE4B492D4D
	for <dm-devel@redhat.com>; Thu, 16 Dec 2021 17:49:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1DF7811E78
	for <dm-devel@redhat.com>; Thu, 16 Dec 2021 17:49:19 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
	[209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-671-XXJh2OyFOkGNr8cTVe2fJw-1; Thu, 16 Dec 2021 12:49:18 -0500
X-MC-Unique: XXJh2OyFOkGNr8cTVe2fJw-1
Received: by mail-qt1-f198.google.com with SMTP id
	a26-20020ac8001a000000b002b6596897dcso34317000qtg.19
	for <dm-devel@redhat.com>; Thu, 16 Dec 2021 09:49:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition;
	bh=Uus2LlgeYJCvwWfnb8E4TOJ1KGMOueUkeobkNgmBkvc=;
	b=5vme1q4wZZeow47k5tzwuW8qSgG7O9GhO4JAlmTJP09nSSCIXiZLxn9wMIvGUV89DF
	/oEchb9jrzcfgwJJBkEABmsWvIUoICFLgtI7+HTVNNmxBMXTGc21aFblHumTtX1s7TVm
	yK3nyh8K/azf0MgxhNKIr9vl+j/wkJzVdAde3sKFOuJUkwZBZqJYEz+lvuCOSRk5/iSY
	Nr/5WgDma1he2KBnhQKpmi3gaPHcDm5f2h3STnx+EnetHUlHxaYPLXXrW0ebqS6riHhD
	tqEYr2q7Rm7Hv67fTuR8dTb5AZvLkL4yPHxzsaAWUgtsca0lF7UsDl+cHB2fEgwG9chd
	/+Lw==
X-Gm-Message-State: AOAM531YYmiDfcsNbdnLAi0ou9dqkbxrgt8cu+/misK27szwu7z1QhlS
	lAZXyImFrrwfjmG0NOH9ugmYjKZL1V6Df8fJ4DH7smrBpVv135O0PIA+eczltH3rxkE0/yHrorK
	1qBUK4NinFaaTDQ==
X-Received: by 2002:a05:6214:21e8:: with SMTP id
	p8mr3290973qvj.99.1639676957910; 
	Thu, 16 Dec 2021 09:49:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfr9CXl+tDzP8DP1paHbyAMY7lcF94YJrxp3xBRUedepEpRuRV2qjHKsXyT4vNfpZctqGQRQ==
X-Received: by 2002:a05:6214:21e8:: with SMTP id
	p8mr3290965qvj.99.1639676957735; 
	Thu, 16 Dec 2021 09:49:17 -0800 (PST)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	bm35sm3169317qkb.86.2021.12.16.09.49.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Dec 2021 09:49:17 -0800 (PST)
Date: Thu, 16 Dec 2021 12:49:16 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <Ybt8HMQUZn7mlvTG@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Joe Thornber <ejt@redhat.com>, Alasdair G Kergon <agk@redhat.com>
Subject: [dm-devel] [git pull] device mapper fixes for 5.16-rc6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

The following changes since commit 136057256686de39cc3a07c2e39ef6bc43003ff6:

  Linux 5.16-rc2 (2021-11-21 13:47:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.16/dm-fixes

for you to fetch changes up to 1cef171abd39102dcc862c6bfbf7f954f4f1f66f:

  dm integrity: fix data corruption due to improper use of bvec_kmap_local (2021-12-15 14:16:35 -0500)

Please pull, thanks.
Mike

----------------------------------------------------------------
- Fix use after free in DM btree remove's rebalance_children().

- Fix DM integrity data corruption, introduced during 5.16 merge, due
  to improper use of bvec_kmap_local().

----------------------------------------------------------------
Joe Thornber (1):
      dm btree remove: fix use after free in rebalance_children()

Mike Snitzer (1):
      dm integrity: fix data corruption due to improper use of bvec_kmap_local

 drivers/md/dm-integrity.c                    | 2 +-
 drivers/md/persistent-data/dm-btree-remove.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

