Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 74D0D21E10A
	for <lists+dm-devel@lfdr.de>; Mon, 13 Jul 2020 21:55:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-VfICAej9NkOHINk2J0Gz3w-1; Mon, 13 Jul 2020 15:55:49 -0400
X-MC-Unique: VfICAej9NkOHINk2J0Gz3w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1E6818C63C6;
	Mon, 13 Jul 2020 19:55:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61153710A1;
	Mon, 13 Jul 2020 19:55:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 87D0794EF2;
	Mon, 13 Jul 2020 19:55:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06CLpaid017110 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 12 Jul 2020 17:51:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D93A110CD2C0; Sun, 12 Jul 2020 21:51:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 605F010CD2C9
	for <dm-devel@redhat.com>; Sun, 12 Jul 2020 21:51:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B7A2100E7C4
	for <dm-devel@redhat.com>; Sun, 12 Jul 2020 21:51:30 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-273-ke4gwqBTNcuQckhWFv61aA-1; Sun, 12 Jul 2020 17:51:26 -0400
X-MC-Unique: ke4gwqBTNcuQckhWFv61aA-1
Received: by mail-pl1-f169.google.com with SMTP id p1so4590890pls.4;
	Sun, 12 Jul 2020 14:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bRSG2fZqVT4UeuTbHHFbHUXJz86oOqdjBc6h69wvdUc=;
	b=LyeJzQydMyu4crb4zHHjc+GgHUuQdXmSwnlg2aePMW3Lk4H/4fvdgD2ROLSyhWfOpF
	FR8SZ1Yi+C1eHhUnirKTUopuehtU6vTIJoeYdWtu1l7yUdqd9UpIDUiGWv/KS4wQ8SHL
	QU8tnMP527M07Ewxx1nv9MYydjb9MggVxznyz1bLavO2+pUMrlArAPSaCozRg+yW+yz6
	6Uzc/DfENygMFXs8R/XsN9LBpFqQXiFBpK/4/wF4dlIGX3SWgm60iU6d/q5Vxqeb/MRT
	pqGNcAGCY5mpgfrbmWQFQxJW1JkDTMprv9bxuH2P6d6hTtuscW+fJBPGC0FHEw5Xn79t
	LVXQ==
X-Gm-Message-State: AOAM530Q1D3WedRl12weAMppxIzDG115szWhQ8FgdxYISk2lzvsJ3cV3
	M/md51Rs4LR/w9skM/grIQKYds4TSgg+qA==
X-Google-Smtp-Source: ABdhPJzq/mlsVJQ8ODerlTyOAvWaF1gJn7w2kQbdx/KvRg3k1SXaWsgUMDIs2/feg500Rkmtx3tDKQ==
X-Received: by 2002:a17:902:bb8a:: with SMTP id
	m10mr11610550pls.137.1594590684353; 
	Sun, 12 Jul 2020 14:51:24 -0700 (PDT)
Received: from austin-fedora.cs.nctu.edu.tw (IP-168-124.cs.nctu.edu.tw.
	[140.113.168.124]) by smtp.googlemail.com with ESMTPSA id
	a68sm12800964pje.35.2020.07.12.14.51.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 12 Jul 2020 14:51:23 -0700 (PDT)
From: Austin Chang <austin880625@gmail.com>
To: dm-devel@redhat.com
Date: Mon, 13 Jul 2020 05:47:00 +0800
Message-Id: <20200712214700.337298-1-austin880625@gmail.com>
In-Reply-To: <20200712211045.GA332416@austin-fedora>
References: <20200712211045.GA332416@austin-fedora>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 13 Jul 2020 15:55:23 -0400
Cc: Austin Chang <austin880625@gmail.com>, Mike Snitzer <snitzer@redhat.com>,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, Alasdair Kergon <agk@redhat.com>
Subject: [dm-devel] [PATCH v2] dm-cache: document zeroing metadata device
	step
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

Inform dmsetup users to zero the first 4k of the metadata device at
cache creation in examples, just as mentioned in thin-provisioning
documentation. Instructions to use lvmcache for end users may be added
as well.

Link: https://www.redhat.com/archives/dm-devel/2013-April/msg00124.html
Signed-off-by: Austin Chang <austin880625@gmail.com>
---
Changes in v2:
- Correct the dd arguments

 Documentation/admin-guide/device-mapper/cache.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/admin-guide/device-mapper/cache.rst b/Documentation/admin-guide/device-mapper/cache.rst
index f15e5254d05b..16a1c96946a6 100644
--- a/Documentation/admin-guide/device-mapper/cache.rst
+++ b/Documentation/admin-guide/device-mapper/cache.rst
@@ -330,6 +330,10 @@ https://github.com/jthornber/device-mapper-test-suite
 
 ::
 
+  # When using dmsetup directly instead of volume manager like lvm2,
+  # the first 4k of the metadata device should be zeroed to indicate
+  # empty metadata.
+  dd if=/dev/zero of=/dev/mapper/metadata bs=4k count=1
   dmsetup create my_cache --table '0 41943040 cache /dev/mapper/metadata \
 	  /dev/mapper/ssd /dev/mapper/origin 512 1 writeback default 0'
   dmsetup create my_cache --table '0 41943040 cache /dev/mapper/metadata \
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

