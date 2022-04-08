Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ADD4F9B63
	for <lists+dm-devel@lfdr.de>; Fri,  8 Apr 2022 19:13:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649438025;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IE7PeNeoncDruxlF02JkJvZFPXg67LfzI0JnfCMX3ks=;
	b=YR2uvhBdg+uc3WVPK72dflSRz+2HWPdbQJdNSO7Dq59pDaGybzZVTZ2Bb4fhV0BBaiBXl4
	pPp2vSGYPRv14wXte6KkqY58+4bKQnwU9hTONN4Q4m4X6g2jRpVt7KLTDmNgNc+nerEpZJ
	6IdhiFGjIATKA53WtSFch5TzGPMt4ww=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-sTJ7AYk8OK6SY_cuTivXWQ-1; Fri, 08 Apr 2022 13:13:43 -0400
X-MC-Unique: sTJ7AYk8OK6SY_cuTivXWQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 242F185A5A8;
	Fri,  8 Apr 2022 17:13:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E80C7AF5;
	Fri,  8 Apr 2022 17:13:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B62D41940351;
	Fri,  8 Apr 2022 17:13:34 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B03AF1940341
 for <dm-devel@listman.corp.redhat.com>; Fri,  8 Apr 2022 17:13:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8CF942166B1F; Fri,  8 Apr 2022 17:13:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-8-29.pek2.redhat.com [10.72.8.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50DC82166BA3;
 Fri,  8 Apr 2022 17:13:02 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Date: Sat,  9 Apr 2022 01:12:51 +0800
Message-Id: <20220408171254.935171-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [dm-devel] [PATCH 0/3] dm: improvement on io referencing and io poll
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
Cc: dm-devel@redhat.com, Ming Lei <ming.lei@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

The 1st patch removes get/put io reference in dm_zone_map_bio.

The 2nd one improves io referencing.

The 3rd patch switches to hold dm_io instance in single list.


Ming Lei (3):
  dm: don't grab target io reference in dm_zone_map_bio
  dm: improve target io referencing
  dm: put all polled io into one single list

 drivers/md/dm-core.h |  9 +----
 drivers/md/dm-zone.c | 10 ------
 drivers/md/dm.c      | 79 ++++++++++++++++++++++++++++----------------
 3 files changed, 51 insertions(+), 47 deletions(-)

-- 
2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

