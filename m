Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6A58721E108
	for <lists+dm-devel@lfdr.de>; Mon, 13 Jul 2020 21:55:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-wDo7L76WMJCwVUP8ObGGuw-1; Mon, 13 Jul 2020 15:55:49 -0400
X-MC-Unique: wDo7L76WMJCwVUP8ObGGuw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E553E18C63C2;
	Mon, 13 Jul 2020 19:55:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 612466FDD1;
	Mon, 13 Jul 2020 19:55:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8786894EEE;
	Mon, 13 Jul 2020 19:55:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06CJf3jH002740 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 12 Jul 2020 15:41:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B134C1008B98; Sun, 12 Jul 2020 19:41:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC97110D18D8
	for <dm-devel@redhat.com>; Sun, 12 Jul 2020 19:41:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEBED85A5B2
	for <dm-devel@redhat.com>; Sun, 12 Jul 2020 19:41:01 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-20-pdTEXzp-OwCxO9zPCnQJ8g-1; Sun, 12 Jul 2020 15:40:59 -0400
X-MC-Unique: pdTEXzp-OwCxO9zPCnQJ8g-1
Received: by mail-pj1-f53.google.com with SMTP id k5so5085420pjg.3;
	Sun, 12 Jul 2020 12:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9buC95cnJzujQoCsS6dEnvpWRaAnbJrXb6bBm8BLPgM=;
	b=Xa8D+x2v2qaQfDZcPQ3KJNfUa3EN1MHB2qoKhDdQIk10XPQYtZpNu6jIYXcWHBebO8
	aes0joTdrcti38NUvtaL2HislaL2G+pYnvsM3yqjxJ5kcs+SAo6uMTm902CeutzpYI31
	Jkclmo4kb4lG7pcQXPYPfG/GofDVNWUhHl0VZERkVckC/hY6yeOUZZADGkqHVxZ8DBhb
	10l+i/n7sB6vHNNlz8qxPy74cI5rRtcnEB+U9YV7XAqw0dtDEAgOws3NvoauB8sGpZUf
	V9LH9mtlFK3JAFzqRR6h9C5vE3ks+nKAQ76FhRvv6oS9FpmIMmkQmlXUe0F5wnWoHFXh
	WRbQ==
X-Gm-Message-State: AOAM531wSAM/kAVMaI27WNTIqEpWSVQGudDa3D3GaKPsrawGaXO0TUky
	3Rj49sCMzUUmyssAG5F70MhtBTrHOAWTBw==
X-Google-Smtp-Source: ABdhPJwBZgFDS5BbNuVabr/inCzFSsgd1JbaUvpTumREOnUuorknifA0z738HWJAWGAgT+/UpD4LRw==
X-Received: by 2002:a17:90b:2350:: with SMTP id
	ms16mr16982933pjb.127.1594582857254; 
	Sun, 12 Jul 2020 12:40:57 -0700 (PDT)
Received: from austin-fedora.cs.nctu.edu.tw (IP-168-124.cs.nctu.edu.tw.
	[140.113.168.124]) by smtp.googlemail.com with ESMTPSA id
	a3sm11463222pgd.73.2020.07.12.12.40.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 12 Jul 2020 12:40:56 -0700 (PDT)
From: Austin Chang <austin880625@gmail.com>
To: dm-devel@redhat.com
Date: Mon, 13 Jul 2020 03:40:39 +0800
Message-Id: <20200712194039.329035-1-austin880625@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 13 Jul 2020 15:55:23 -0400
Cc: Austin Chang <austin880625@gmail.com>, Mike Snitzer <snitzer@redhat.com>,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, Alasdair Kergon <agk@redhat.com>
Subject: [dm-devel] [PATCH] dm-cache: document zeroing metadata device step
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Inform dmsetup users to zero the first 4k of the metadata device at
cache creation in examples, just as mentioned in thin-provisioning
documentation. Instructions to use lvmcache for end users may be added
as well.

Link: https://www.redhat.com/archives/dm-devel/2013-April/msg00124.html
Signed-off-by: Austin Chang <austin880625@gmail.com>
---
 Documentation/admin-guide/device-mapper/cache.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/admin-guide/device-mapper/cache.rst b/Documentation/admin-guide/device-mapper/cache.rst
index f15e5254d05b..ef9a82d50d19 100644
--- a/Documentation/admin-guide/device-mapper/cache.rst
+++ b/Documentation/admin-guide/device-mapper/cache.rst
@@ -330,6 +330,10 @@ https://github.com/jthornber/device-mapper-test-suite
 
 ::
 
+  # When using dmsetup directly instead of volume manager like lvm2,
+  # the first 4k of the metadata device should be zeroed to indicate
+  # empty metadata.
+  dd if=/dev/zero of=/dev/mapper/metadata bs=4k conv=notrunc
   dmsetup create my_cache --table '0 41943040 cache /dev/mapper/metadata \
 	  /dev/mapper/ssd /dev/mapper/origin 512 1 writeback default 0'
   dmsetup create my_cache --table '0 41943040 cache /dev/mapper/metadata \
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

