Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 921D26AF98A
	for <lists+dm-devel@lfdr.de>; Tue,  7 Mar 2023 23:49:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678229389;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=o3JdsKdhKu0iDPi8LNV3rOmKPkjIUbNxGQtcJXfTEAM=;
	b=cAHcedHfhIvFwMpsPfFIomCPwJUf4X9VpE3ND/VwMvhGv9SfaHisRlSFn361jL7ujsKro1
	PTAi61TNhbFUDCbtqEmCQ8qwnjLMdYFkY1mPkiT+QtAlMtZEzey7qr8vD1LwjDZPZxiEg3
	K8oZJc5yPF0LIy69GQiwwayYfzs1CQI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-egPrcbAIMj6uPhfbjKniqQ-1; Tue, 07 Mar 2023 17:49:48 -0500
X-MC-Unique: egPrcbAIMj6uPhfbjKniqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4904480D183;
	Tue,  7 Mar 2023 22:49:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F28724014D10;
	Tue,  7 Mar 2023 22:49:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 11B8C19465B8;
	Tue,  7 Mar 2023 22:49:38 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DDC3A1946594
 for <dm-devel@listman.corp.redhat.com>; Tue,  7 Mar 2023 22:49:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 668432026D68; Tue,  7 Mar 2023 22:49:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43A582026D4B;
 Tue,  7 Mar 2023 22:49:36 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 327MnYqs018826;
 Tue, 7 Mar 2023 16:49:34 -0600
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 327MnYmC018825;
 Tue, 7 Mar 2023 16:49:34 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue,  7 Mar 2023 16:49:31 -0600
Message-Id: <1678229374-18788-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [dm-devel] [PATCH 0/3] handle transitioning devices in TUR checker
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
Cc: device-mapper development <dm-devel@redhat.com>,
 Brian Bunker <brian@purestorage.com>, Martin Wilck <Martin.Wilck@suse.com>
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patchset is based on Brian Bunker's "libmultipath: return
'ghost' state when port is in transition" patch:

https://listman.redhat.com/archives/dm-devel/2023-February/053344.html
https://github.com/opensvc/multipath-tools/pull/60

Instead of setting the state to PATH_GHOST, it uses PATH_PENDING. The
other two patches are small cleanups to the TUR checker that I noticed
while writing the first patch.

Benjamin Marzinski (3):
  libmultipath: return 'pending' state when port is in transition
  libmultipath: set init failure message when init fails
  libmultipath: reset nr_timeouts if we freed the context

 libmultipath/checkers/tur.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

