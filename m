Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7D221432F
	for <lists+dm-devel@lfdr.de>; Sat,  4 Jul 2020 05:23:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-UBJJgb7lMQSIoAbqo4Oj6g-1; Fri, 03 Jul 2020 23:23:55 -0400
X-MC-Unique: UBJJgb7lMQSIoAbqo4Oj6g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 212978018A3;
	Sat,  4 Jul 2020 03:23:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00BC91E6;
	Sat,  4 Jul 2020 03:23:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AFDA1180954D;
	Sat,  4 Jul 2020 03:23:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0643NhPe002620 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 23:23:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 31833CF630; Sat,  4 Jul 2020 03:23:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 163A2CF631
	for <dm-devel@redhat.com>; Sat,  4 Jul 2020 03:23:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51A53800260
	for <dm-devel@redhat.com>; Sat,  4 Jul 2020 03:23:40 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-226-AJNKaVQsMOCIP353mQDAPw-1; Fri, 03 Jul 2020 23:23:38 -0400
X-MC-Unique: AJNKaVQsMOCIP353mQDAPw-1
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrYjg-0000Ri-Dx; Sat, 04 Jul 2020 03:21:05 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Fri,  3 Jul 2020 20:20:15 -0700
Message-Id: <20200704032020.21923-9-rdunlap@infradead.org>
In-Reply-To: <20200704032020.21923-1-rdunlap@infradead.org>
References: <20200704032020.21923-1-rdunlap@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: platform-driver-x86@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-nfs@vger.kernel.org, Len Brown <lenb@kernel.org>,
	linux-doc@vger.kernel.org, linux-pm@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	cgroups@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	linux-media@vger.kernel.org
Subject: [dm-devel] [PATCH 08/13] Documentation/admin-guide: arm-ccn: drop
	doubled word
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Drop the doubled word "as".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/admin-guide/perf/arm-ccn.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200701.orig/Documentation/admin-guide/perf/arm-ccn.rst
+++ linux-next-20200701/Documentation/admin-guide/perf/arm-ccn.rst
@@ -27,7 +27,7 @@ Crosspoint PMU events require "xp" (inde
 and "vc" (virtual channel ID).
 
 Crosspoint watchpoint-based events (special "event" value 0xfe)
-require "xp" and "vc" as as above plus "port" (device port index),
+require "xp" and "vc" as above plus "port" (device port index),
 "dir" (transmit/receive direction), comparator values ("cmp_l"
 and "cmp_h") and "mask", being index of the comparator mask.
 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

